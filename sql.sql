drop table public.users;
CREATE TABLE public.users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  auth_id UUID not null,
  f_name varchar(55),
  l_name varchar(55),
   image varchar(255)
   resume varchar(255)
  email VARCHAR(255) NOT NULL UNIQUE,
  allow_edit VARCHAR(255) DEFAULT false;
  role role_enum DEFAULT 'user';
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  FOREIGN key (auth_id) references  auth.users (id)  ON DELETE CASCADE

);

-- Grant update permission on the auth.users table to the authenticated role
GRANT UPDATE ON TABLE auth.users TO service_role;



-- Create the function with SECURITY DEFINER
CREATE OR REPLACE FUNCTION update_auth_user_metadata()
RETURNS TRIGGER AS $$
BEGIN
  -- Update the auth.users metadata with the new user's id and role
  UPDATE auth.users
  SET raw_user_meta_data = raw_user_meta_data || jsonb_build_object('public_user_id', NEW.id::text, 'role', 'user',)
  WHERE email = NEW.email;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Create the trigger
CREATE OR REPLACE TRIGGER after_user_insert
AFTER INSERT ON public.users
FOR EACH ROW
EXECUTE FUNCTION update_auth_user_metadata();



CREATE TABLE public.allows (
  id UUID not null PRIMARY KEY ,
  allow_add boolean DEFAULT false,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  FOREIGN key (id) references  public.users (id)  ON DELETE CASCADE
);

//------------
CREATE OR REPLACE FUNCTION generate_custom_id(prefix VARCHAR, length INT)
RETURNS VARCHAR AS $$
DECLARE
    chars VARCHAR := '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    result VARCHAR := prefix;  -- Start with the given prefix
    i INT := 1;
BEGIN
    IF length <= LENGTH(prefix) THEN
        RAISE EXCEPTION 'Length should be greater than prefix length';
    END IF;

    FOR i IN 1..(length - LENGTH(prefix)) LOOP
        result := result || substr(chars, floor(random() * length(chars) + 1)::INT, 1);
    END LOOP;
    RETURN result;
END;
$$ LANGUAGE plpgsql;


//-----




drop table user_account;

CREATE TABLE user_account (
  user_id UUID NOT NULL PRIMARY KEY,
  linkedin VARCHAR(255) ,
  github VARCHAR(255),
  resume text,
  bindlink VARCHAR(255),
  FOREIGN key (user_id) references public.users (id) ON DELETE CASCADE
);
drop table projects CASCADE;

CREATE TABLE
  projects (
    project_id VARCHAR(12) NOT NULL PRIMARY KEY DEFAULT generate_custom_id ('p-', 12),
    project_name TEXT,
    bootcamp_name TEXT,
    start_date DATE,
    end_date DATE,
    presentation_date DATE,
    project_description TEXT,
    logo_url TEXT,
    presentation_url TEXT,
    user_id uuid NOT NULL,
    admin_id uuid NOT NULL,
    type type_project not null default 'app'
    time_end_edit date NOT NULL default current_date,
    allow_edit BOOLEAN NOT NULL default false,
    is_public BOOLEAN NOT NULL default false,
    create_at TIMESTAMP NOT NULL default current_timestamp,
    update_at TIMESTAMP,
    FOREIGN key (user_id) references public.users (id) ON DELETE CASCADE
  );

ALTER TABLE projects
ADD COLUMN type TEXT DEFAULT 'app';

-- Add a check constraint to ensure values are within the allowed enum values
ALTER TABLE projects
ADD CONSTRAINT type_check
CHECK (type IN ('app', 'website', 'vr', 'ar', 'ai', 'ml', 'ui/ux', 'gaming', 'unity',
                'cyber', 'software', 'automation', 'robotic', 'api', 'analytics', 'iot', 'cloud','hardware','other'));
drop table images_project;


CREATE TABLE
  images_project (
    project_id VARCHAR(12),
    id bigint not null ,
    url text,
     primary key (
      project_id,
      id
    ),
    FOREIGN key (project_id) references public.projects (project_id) ON DELETE CASCADE
  );

drop table links_project;

CREATE TABLE
  links_project (
    project_id VARCHAR(12),
    type link_project not null,
    url text  null,
    primary key (
      project_id,
      type
    ),
    FOREIGN key (project_id) references public.projects (project_id) ON DELETE CASCADE
  );

drop table members_project;


CREATE TABLE
  members_project (
    project_id VARCHAR(12),
    user_id uuid NOT NULL,
    position TEXT NOT NULL,
     primary key (
      project_id,
      user_id
    ),
    FOREIGN key (project_id) references public.projects (project_id) ON DELETE CASCADE,
    FOREIGN key (user_id) references public.users (id) ON DELETE CASCADE
  );



CREATE TABLE tags (
    tag_id SERIAL PRIMARY KEY,
    tag_name TEXT UNIQUE NOT NULL
);

CREATE TABLE project_tags (
    project_id VARCHAR(12) NOT NULL,
    tag_id INTEGER NOT NULL,
    PRIMARY KEY (project_id, tag_id),
    FOREIGN KEY (project_id) REFERENCES projects (project_id) ON DELETE CASCADE,
    FOREIGN KEY (tag_id) REFERENCES tags (tag_id) ON DELETE CASCADE
);




drop table project_evaluation;

CREATE TABLE project_evaluation (
    id SERIAL PRIMARY KEY,
    project_id VARCHAR(12),
    user_id uuid NOT NULL,
    comment text ,
    idea INT CHECK (idea >= 0 AND idea <= 10),
    design INT CHECK (design >= 0 AND design <= 10),
    tools INT CHECK (tools >= 0 AND tools <= 10),
    practices INT CHECK (practices >= 0 AND practices <= 10),
    presentation INT CHECK (presentation >= 0 AND presentation <= 10),
    investment INT CHECK (investment >= 0 AND investment <= 10),
    total_score INT GENERATED ALWAYS AS (idea + design + tools + practices + presentation + investment) STORED,
    FOREIGN key (project_id) references public.projects (project_id) ON DELETE CASCADE,
    FOREIGN key (user_id) references public.users (id) ON DELETE CASCADE


);

INSERT INTO project_evaluation (project_id,user_id,comment, idea, design, tools, practices, presentation, investment) 
VALUES ('p-ZflUG9khzc','80eb1743-a679-47de-a8c4-366b2bd5a96c','here is commit', 8, 7, 9, 8, 6, 7);





//--


 DROP FUNCTION update_project_updated_at(text);

CREATE OR REPLACE FUNCTION update_project_updated_at(id TEXT)
RETURNS VOID AS $$
BEGIN
    UPDATE projects
    SET update_at = current_timestamp
    WHERE project_id = project_id;
END;
$$ LANGUAGE plpgsql;
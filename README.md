

# Twuaiq Project Gallery API Documentation

## Introduction

This API is designed for the Twuaiq Project Gallery, where projects from bootcamp graduates can be showcased. The platform includes three user roles: Users, Supervisors, and Admins, each with distinct permissions.

## User Roles and Permissions

### Users

- View all projects
- Edit their own projects
- Update personal profile information, including profile picture, CV, and social media accounts

### Supervisors

- Create projects for users
- Delete projects they create
- Edit and update any project details they create
- Manage project visibility and status they create
- View and edit their own profile

### Admins

- All permissions of Supervisors and Users
- Create and delete any projects for users or Supervisors
- Promote or demote users to Supervisors or Admins

## API Endpoints

---

### Authentication

#### Create New Account

- **URL Endpoint:** `/v1/auth/create/new/account`
- **Method:** `POST`
- **URL PATH:** `<url>/v1/auth/create/new/account`
- **Headers:** None
- **Body:**

```json
{
  "email": "jicak84594@maxturns.com",
  "f_name": "User",
  "l_name": "test"
}
```

- **Body Field Descriptions:**

  - `email`: The user's email address `required`
  - `f_name`: The user's first name `optional`
  - `l_name`: The user's last name `optional`

- **Response Example:**

```json
{
  "status": "success",
  "message": "Account created successfully"
}
```

#### Login

- **URL Endpoint:** `/v1/auth/login`
- **Method:** `POST`
- **URL PATH:** `<url>/v1/auth/login`
- **Headers:** None
- **Body:**

```json
{
  "email": "jicak84594@maxturns.com"
}
```

- **Body Field Descriptions:**

  - `email`: The user's email address `required`

- **Response Example:**

```json
{
  "status": "success",
  "message": "Logged in successfully",
  "token": "YOUR_ACCESS_TOKEN"
}
```

#### Verify Account

- **URL Endpoint:** `/v1/auth/verify`
- **Method:** `POST`
- **URL PATH:** `<url>/v1/auth/verify`
- **Headers:** None
- **Body:**

```json
{
  "email": "jicak84594@maxturns.com",
  "otp": "425596"
}
```

- **Body Field Descriptions:**

  - `email`: The user's email address `required`
  - `otp`: The OTP sent to the user's email `required`

- **Response Example:**

```json
{
  "status": "success",
  "message": "Account verified successfully"
}
```

---

### Profile Management

#### Get User Profile

- **URL Endpoint:** `/v1/user/profile`
- **Method:** `GET`
- **URL PATH:** `<url>/v1/user/profile`
- **Headers:**
  - `Authorization: Bearer <YOUR_ACCESS_TOKEN>`
- **Response Example:**

```json
{
  "email": "user@example.com",
  "f_name": "John",
  "l_name": "Doe",
  "image": "image_link",
  "cv": "cv_link",
  "accounts": {
    "linkedin": "linkedin_profile",
    "github": "github_profile"
  }
}
```

#### Update User Profile

- **URL Endpoint:** `/v1/user/update/profile`
- **Method:** `PUT`
- **URL PATH:** `<url>/v1/user/update/profile`
- **Headers:**
  - `Authorization: Bearer <YOUR_ACCESS_TOKEN>`
- **Body:**

```json
{
  "first_name": "mohammed",
  "last_name": "alazmi",
  "image": [1, 2, 3, 4],
  "cv": [1, 2, 3, 4],
  "accounts": {
    "bindlink": "fahad",
    "linkedin": "rahaf-alshahrani-20bb67239",
    "github": "mohammed_19994"
  }
}
```

- **Body Field Descriptions:**

  - `first_name`: The user's first name `optional`
  - `last_name`: The user's last name `optional`
  - `image`: An array representing the user's profile image `optional`
  - `cv`: An array representing the user's CV `optional`
  - `accounts`: An object containing links to the user's social media accounts `optional`
  - `bindlink`: A bindlink account `required`
  - `linkedin`: A LinkedIn profile `required`
  - `github`: A GitHub profile `required`

- **Response Example:**

```json
{
  "status": "success",
  "message": "Profile updated successfully"
}
```

---

### Admin Management

#### Change User Role

- **URL Endpoint:** `/v1/admin/change/role/user`
- **Method:** `PUT`
- **URL PATH:** `<url>/v1/admin/change/role/user`
- **Headers:**
  - `Authorization: Bearer <YOUR_ACCESS_TOKEN>`
- **Body:**

```json
{
  "id_user": "f86385c7-9913-4ab6-8ce5-42edba6b1f6a",
  "role": "supervisor"
}
```

- **Body Field Descriptions:**

  - `id_user`: The ID of the user whose role is to be changed `required`
  - `role`: The new role for the user (e.g., supervisor, admin) `required`

- **Response Example:**

```json
{
  "status": "success",
  "message": "User role updated successfully"
}
```

---

### Project Management

#### Create Project

- **URL Endpoint:** `/v1/supervisor/create/project`
- **Method:** `POST`
- **URL PATH:** `<url>/v1/supervisor/create/project`
- **Headers:**
  - `Authorization: Bearer <YOUR_ACCESS_TOKEN>`
- **Body:**

```json
{
  "user_id": "6ca9bc46-217e-48ed-9fde-4b0ff57ad4b6",
  "time_end_edit": "31/12/2024",
  "edit": "true"
}
```

- **Body Field Descriptions:**

  - `user_id`: The ID of the user for whom the project is being created `required`
  - `time_end_edit`: The end date for editing the project `required`
  - `edit`: A boolean indicating if the project can be edited `required`

- **Response Example:**

```json
{
  "status": "success",
  "message": "Project created successfully"
}
```

#### Change Project Status

- **URL Endpoint:** `/v1/supervisor/change/status/<id>`
- **Method:** `PUT`
- **URL PATH:** `<url>/v1/supervisor/change/status/p-ujg6ra7RdH`
- **Headers:**
  - `Authorization: Bearer <YOUR_ACCESS_TOKEN>`
- **Body:**

```json
{
  "time_end_edit": "11/12/2024",
  "edit": true,
  "rating": true,
  "public": true
}
```

- **Body Field Descriptions:**

  - `time_end_edit`: The end date for editing the project `required`
  - `edit`: A boolean indicating if the project can be edited `required`
  - `rating`: A boolean indicating if the project can be rated `required`
  - `public`: A boolean indicating if the project is public `required`

- **Response Example:**

```json
{
  "status": "success",
  "message": "Project status updated successfully"
}
```

#### Delete Project

- **URL Endpoint:** `/v1/supervisor/delete/project/<id>`
- **Method:** `DELETE`
- **URL PATH:** `<url>/v1/supervisor/delete/project/p-kELH1APens`
- **Headers:**
  - `Authorization: Bearer <YOUR_ACCESS_TOKEN>`
- **Body:**

```json
{
  "time_end_edit": "11/12/2024",
  "allow_edit": true,
  "is_public": true
}
```

- **Body Field Descriptions:**

  - `time_end_edit`: The end date for editing the project `required`
  - `allow_edit`: A boolean indicating if editing is allowed `required`
  - `is_public`: A boolean indicating if the project is public `required`

- **Response Example:**

```json
{
  "status": "success",
  "message": "Project deleted successfully"
}
```

### Rating Project

#### Rate Project

- **URL Endpoint:** `/v1/user/rating/project/<id>`
- **Method:** `POST`
- **URL PATH:** `<url>/v1/user/rating/project/p-V2CEUkBcfd`
- **Headers:**
  - `Authorization: Bearer <YOUR_ACCESS_TOKEN>`
- **Body:**

```json
{
  "idea": 5,
  "design": 9,
  "tools": 10,
  "practices": 7,
  "presentation": 2,
  "investment": 1,
  "note": "here i am"
}
```

- **Body Field Descriptions:**

  - `idea`: Rating for the

 idea (1-10) `required`
  - `design`: Rating for the design (1-10) `required`
  - `tools`: Rating for the tools used (1-10) `required`
  - `practices`: Rating for the practices followed (1-10) `required`
  - `presentation`: Rating for the presentation (1-10) `required`
  - `investment`: Rating for the investment (1-10) `required`
  - `note`: Additional notes or comments `optional`

- **Response Example:**

```json
{
  "status": "success",
  "message": "Project rated successfully"
}
```

---

### Public Access

#### Get Project by ID

- **URL Endpoint:** `/v1/get/project/<id>`
- **Method:** `GET`
- **URL PATH:** `<url>/v1/get/project/p-ujg6ra7RdH`
- **Headers:** None
- **Response Example:**

```json
{
  "project_name": "Amazing Flutter App",
  "bootcamp_name": "Flutter Bootcamp 2024",
  "type": "website",
  "start_date": "15/12/2024",
  "end_date": "15/12/2024",
  "presentation_date": "15/12/2024",
  "project_description": "An amazing Flutter app that revolutionizes user experience.",
  "members": [
    {
      "position": "ui",
      "user_id": "6ca9bc46-217e-48ed-9fde-4b0ff57ad4b6"
    },
    {
      "position": "Developer",
      "user_id": "edc41350-526e-40af-97be-2e32a78d55bd"
    }
  ],
  "rating": {
    "idea": 5,
    "design": 5,
    "tools": 5,
    "practices": 5,
    "presentation": 5,
    "investment": 5,
    "note": "here i am"
  }
}
```

#### All Projects or Filtration

- **URL Endpoint:** `/v1/projects<?parm>`
- **Method:** `GET`
- **URL PATH:** `<url>/v1/projects`
- **URL PATH:** `<url>/v1/projects?name=test`
- **URL PATH:** `<url>/v1/projects?name=test&to=1&from=2`
- **URL PATH:** `<url>/v1/projects?name=test&to=1&from=2&bootcamp=java`
- **URL PATH:** `<url>/v1/projects?name=test&to=1&from=2&bootcamp=java&type=website`
- **Headers:** None
- **Response Example:**

```json
[
  {
    "project_name": "Amazing Flutter App",
    "bootcamp_name": "Flutter Bootcamp 2024",
    "type": "website",
    "start_date": "15/12/2024",
    "end_date": "15/12/2024",
    "presentation_date": "15/12/2024",
    "project_description": "An amazing Flutter app that revolutionizes user experience.",
    "members": [
      {
        "position": "ui",
        "user_id": "6ca9bc46-217e-48ed-9fde-4b0ff57ad4b6"
      },
      {
        "position": "Developer",
        "user_id": "edc41350-526e-40af-97be-2e32a78d55bd"
      }
    ],
    "rating": {
      "idea": 5,
      "design": 5,
      "tools": 5,
      "practices": 5,
      "presentation": 5,
      "investment": 5,
      "note": "here i am"
    }
  }
]
```
```
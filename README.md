
# Twuaiq API Documentation

## Introduction
Welcome to the Twuaiq API documentation. This document provides comprehensive information about the available endpoints for managing authentication, user profiles, projects, and administrative tasks on the Twuaiq gallery platform.

### Base URL
All API requests should be made to the following base URL:
```
https://tuwaiq-gallery.onrender.com
```

## Authentication

### Create New Account
**Endpoint:** `POST /v1/auth/create/new/account`

**Description:** Create a new user account.

**Request Body:**
```json
{
    "email": "latib59d271@orsbap.com",
    "f_name": "fahad",
    "l_name": "alazmi"
}
```

**Request Fields:**
- **email** (Required): The email address of the user.
- **f_name** (Optional): The first name of the user.
- **l_name** (Optional): The last name of the user.


**Response:** (Example)
```json
{
	"msg":  "success",
	"data":  {
	"email":  "latib59dddd271@orsbap.com"
	}
}
```

---

### Login
**Endpoint:** `POST /v1/auth/login`

**Description:** Log in to an existing user account.

**Request Body:**
```json
{
    "email": "xalap95777ddd@orsbap.com"
}
```

**Request Fields:**
- **email** (Required): The email address used for logging in.


**Response:** (Example)
```json
{
	"msg":  "success",
	"data":  {
	"email":  "latib59dddd271@orsbap.com"
	}
}
```

---

### Verify
**Endpoint:** `POST /v1/auth/verify`

**Description:** Verify the user's email address using an OTP (One-Time Password).

**Request Body:**
```json
{
    "email": "latib5927dddd1@orsbap.com",
    "otp": "123456"
}
```

**Request Fields:**
- **email** (Required): The email address used for verification.
- **otp** (Required): The OTP sent to the email.


**Response:** (Example)
```json
{
    "msg": "success",
    "data": {
        "token": "YmRiM....",
        "refreshToken": "OTc....",
        "expiresAt": 1722453030
    }
}
```

---
---
---
---

## User Profile

### Get User Profile
**Endpoint:** `GET /v1/user/profile`

**Description:** Retrieve the user's profile information.

**Headers:**
- **Authorization** (Required): `Bearer <token>` - The authentication token granted to the user upon login.

**Response:** (Example)
```json
{
    "msg": "success",
    "data": {
        "id": "0a164eaf-8f34-4fea-9a00-443f1eb05bd9",
        "first_name": "mohammed",
        "last_name": "alazmio",
        "email": "xalap95777@orsbap.com",
        "role": "supervisor",
        "image_url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/users/images/0a164eaf-8f34-4fea-9a00-443f1eb05bd9-2024-07-31%2014:25:54.218298.png",
        "resume_url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/resume/cv/0a164eaf-8f34-4fea-9a00-443f1eb05bd9-2024-07-31%2014:25:54.222366-cv.pdf",
        "link": {
            "github": "https://github.com/fahad0100",
            "linkedin": "https://www.linkedin.com/in/fahad-alazmi/",
            "resume": "https://github.com/fahad0100",
            "bindlink": "https://github.com/fahad0100"
        },
        "projects": [
            {
                "project_id": "p-7IKLodojYY",
                "type": "website",
                "project_name": "Amazing Flutter App",
                "bootcamp_name": "Flutter Bootcamp 2024",
                "start_date": "2024-12-15",
                "end_date": "2024-12-15",
                "presentation_date": "2024-12-15",
                "project_description": "An amazing Flutter app that revolutionizes user experience.",
                "logo_url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/images/projects_logo/p-7IKLodojYY-logo-5914b0be-1fcd-45b3-9217-008e8dc4317e.png",
                "presentation_url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/images/projects.pdf/p-7IKLodojYY-p-a18daefb-0276-4ff2-a6d3-45000d4863af.pdf",
                "user_id": "80eb1743-a679-47de-a8c4-366b2bd5a96c",
                "admin_id": "0a164eaf-8f34-4fea-9a00-443f1eb05bd9",
                "time_end_edit": "2024-12-11",
                "allow_edit": true,
                "is_public": true,
                "create_at": "2024-07-31T12:56:20.692437",
                "update_at": "2024-07-31T19:20:52.485076",
                "images_project": [
                    {
                        "id": 1,
                        "url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/images/project_images/p-7IKLodojYY-1-493232b8-ef65-4106-873c-888451e28a05.png"
                    },
                    {
                        "id": 2,
                        "url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/images/project_images/p-7IKLodojYY-2-fee38f00-bf90-48e0-8762-8290b2220947.png"
                    },
                    {
                        "id": 3,
                        "url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/images/project_images/p-7IKLodojYY-3-7d06d21f-9fff-4628-8f43-27bd54289300.png"
                    }
                ],
                "links_project": [
                    {
                        "url": "https://github.com/example",
                        "type": "github"
                    },
                    {
                        "url": "https://figma.com/example",
                        "type": "figma"
                    },
                    {
                        "url": "https://youtube.com/example",
                        "type": "video"
                    },
                    {
                        "url": "https://appstore.com/example",
                        "type": "pinterest"
                    },
                    {
                        "url": "https://appstore.com/example",
                        "type": "playstore"
                    },
                    {
                        "url": "https://appstore.com/example",
                        "type": "applestore"
                    },
                    {
                        "url": "https://appstore.com/example",
                        "type": "apk"
                    },
                    {
                        "url": null,
                        "type": "weblink"
                    }
                ],
                "members_project": [
                    {
                        "id": "80eb1743-a679-47de-a8c4-366b2bd5a96c",
                        "first_name": "mohammed",
                        "last_name": "alazmio",
                        "email": "hehovik255@maxturns.com",
                        "position": "ui",
                        "image_url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/users/images/80eb1743-a679-47de-a8c4-366b2bd5a96c-2024-07-31%2022:19:08.634807.png",
                        "resume_url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/resume/cv/80eb1743-a679-47de-a8c4-366b2bd5a96c-2024-07-31%2022:19:08.635994-cv.pdf",
                        "link": {
                            "github": "https://github.com/fahad0100",
                            "linkedin": "https://www.linkedin.com/in/fahad-alazmi/",
                            "resume": "https://github.com/fahad0100",
                            "bindlink": "https://github.com/fahad0100"
                        }
                    },
                    {
                        "id": "0a164eaf-8f34-4fea-9a00-443f1eb05bd9",
                        "first_name": "mohammed",
                        "last_name": "alazmio",
                        "email": "xalap95777@orsbap.com",
                        "position": "Developer",
                        "image_url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/users/images/0a164eaf-8f34-4fea-9a00-443f1eb05bd9-2024-07-31%2014:25:54.218298.png",
                        "resume_url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/resume/cv/0a164eaf-8f34-4fea-9a00-443f1eb05bd9-2024-07-31%2014:25:54.222366-cv.pdf",
                        "link": {
                            "github": "https://github.com/fahad0100",
                            "linkedin": "https://www.linkedin.com/in/fahad-alazmi/",
                            "resume": "https://github.com/fahad0100",
                            "bindlink": "https://github.com/fahad0100"
                        }
                    },
                    {
                        "id": "a81adc35-426e-4201-a62e-651085e3e512",
                        "first_name": "fahad",
                        "last_name": "alazmi",
                        "email": "vokoka2166@orsbap.com",
                        "position": "Developer",
                        "image_url": null,
                        "resume_url": null,
                        "link": {}
                    }
                ]
            }
        ],
        "created_at": "2024-07-26T21:10:06.159437+00:00",
        "updated_at": "2024-07-26T21:10:06.159437+00:00"
    }
}
```

---

### Update User Profile
**Endpoint:** `PUT /v1/user/update/profile`

**Description:** Update the user's profile information.

**Headers:**
- **Authorization** (Required): `Bearer <tokenuser>` - The authentication token granted to the user upon login.

**Request Body:**
```json
{
    "first_name": "mohammed",
    "last_name": "alazmio",
    "image": [1, 2, 3, 4],
    "cv": [1, 2, 3, 4],
    "accounts": {
        "github": "https://github.com/fahad0100",
        "resume": "https://example.com/fahad0100",
        "bindlink": "https://bindlink.com/fahad0100",
        "linkedin": "https://www.linkedin.com/in/fahad-alazmi/"
    }
}
```

**Request Fields:**
- **first_name** (Optional): The user's first name (one word).
- **last_name** (Optional): The user's last name (one word).
- **image** (Optional): Binary data representing the profile image.
- **cv** (Optional): Binary data representing the CV.
- **accounts** (Optional): A map of linked accounts with key-value pairs.
  - **github**: URL to the user's GitHub profile.
  - **resume**: URL to the user's resume.
  - **bindlink**: URL to the user's Bindlink profile.
  - **linkedin**: URL to the user's LinkedIn profile.

**Response:** (Example)
```json
{
    "msg": "success",
    "data": {
        "id": "0a164eaf-8f34-4fea-9a00-443f1eb05bd9",
        "first_name": "mohammed",
        "last_name": "alazmio",
        "email": "xalap95777@orsbap.com",
        "role": "supervisor",
        "image_url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/users/images/0a164eaf-8f34-4fea-9a00-443f1eb05bd9-2024-07-31%2014:25:54.218298.png",
        "resume_url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/resume/cv/0a164eaf-8f34-4fea-9a00-443f1eb05bd9-2024-07-31%2014:25:54.222366-cv.pdf",
        "link": {
            "github": "https://github.com/fahad0100",
            "linkedin": "https://www.linkedin.com/in/fahad-alazmi/",
            "resume": "https://github.com/fahad0100",
            "bindlink": "https://github.com/fahad0100"
        },
        "projects": [
            {
                "project_id": "p-7IKLodojYY",
                "type": "website",
                "project_name": "Amazing Flutter App",
                "bootcamp_name": "Flutter Bootcamp 2024",
                "start_date": "2024-12-15",
                "end_date": "2024-12-15",
                "presentation_date": "2024-12-15",
                "project_description": "An amazing Flutter app that revolutionizes user experience.",
                "logo_url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/images/projects_logo/p-7IKLodojYY-logo-5914b0be-1fcd-45b3-9217-008e8dc4317e.png",
                "presentation_url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/images/projects.pdf/p-7IKLodojYY-p-a18daefb-0276-4ff2-a6d3-45000d4863af.pdf",
                "user_id": "80eb1743-a679-47de-a8c4-366b2bd5a96c",
                "admin_id": "0a164eaf-8f34-4fea-9a00-443f1eb05bd9",
                "time_end_edit": "2024-12-11",
                "allow_edit": true,
                "is_public": true,
                "create_at": "2024-07-31T12:56:20.692437",
                "update_at": "2024-07-31T19:20:52.485076",
                "images_project": [
                    {
                        "id": 1,
                        "url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/images/project_images/p-7IKLodojYY-1-493232b8-ef65-4106-873c-888451e28a05.png"
                    },
                    {
                        "id": 2,
                        "url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/images/project_images/p-7IKLodojYY-2-fee38f00-bf90-48e0-8762-8290b2220947.png"
                    },
                    {
                        "id": 3,
                        "url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/images/project_images/p-7IKLodojYY-3-7d06d21f-9fff-4628-8f43-27bd54289300.png"
                    }
                ],
                "links_project": [
                    {
                        "url": "https://github.com/example",
                        "type": "github"
                    },
                    {
                        "url": "https://figma.com/example",
                        "type": "figma"
                    },
                    {
                        "url": "https://youtube.com/example",
                        "type": "video"
                    },
                    {
                        "url": "https://appstore.com/example",
                        "type": "pinterest"
                    },
                    {
                        "url": "https://appstore.com/example",
                        "type": "playstore"
                    },
                    {
                        "url": "https://appstore.com/example",
                        "type": "applestore"
                    },
                    {
                        "url": "https://appstore.com/example",
                        "type": "apk"
                    },
                    {
                        "url": null,
                        "type": "weblink"
                    }
                ],
                "members_project": [
                    {
                        "id": "80eb1743-a679-47de-a8c4-366b2bd5a96c",
                        "first_name": "mohammed",
                        "last_name": "alazmio",
                        "email": "hehovik255@maxturns.com",
                        "position": "ui",
                        "image_url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/users/images/80eb1743-a679-47de-a8c4-366b2bd5a96c-2024-07-31%2022:19:08.634807.png",
                        "resume_url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/resume/cv/80eb1743-a679-47de-a8c4-366b2bd5a96c-2024-07-31%2022:19:08.635994-cv.pdf",
                        "link": {
                            "github": "https://github.com/fahad0100",
                            "linkedin": "https://www.linkedin.com/in/fahad-alazmi/",
                            "resume": "https://github.com/fahad0100",
                            "bindlink": "https://github.com/fahad0100"
                        }
                    },
                    {
                        "id": "0a164eaf-8f34-4fea-9a00-443f1eb05bd9",
                        "first_name": "mohammed",
                        "last_name": "alazmio",
                        "email": "xalap95777@orsbap.com",
                        "position": "Developer",
                        "image_url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/users/images/0a164eaf-8f34-4fea-9a00-443f1eb05bd9-2024-07-31%2014:25:54.218298.png",
                        "resume_url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/resume/cv/0a164eaf-8f34-4fea-9a00-443f1eb05bd9-2024-07-31%2014:25:54.222366-cv.pdf",
                        "link": {
                            "github": "https://github.com/fahad0100",
                            "linkedin": "https://www.linkedin.com/in/fahad-alazmi/",
                            "resume": "https://github.com/fahad0100",
                            "bindlink": "https://github.com/fahad0100"
                        }
                    },
                    {
                        "id": "a81adc35-426e-4201-a62e-651085e3e512",
                        "first_name": "fahad",
                        "last_name": "alazmi",
                        "email": "vokoka2166@orsbap.com",
                        "position": "Developer",
                        "image_url": null,
                        "resume_url": null,
                        "link": {}
                    }
                ]
            }
        ],
        "created_at": "2024-07-26T21:10:06.159437+00:00",
        "updated_at": "2024-07-26T21:10:06.159437+00:00"
    }
}
```

---

## Projects

### Edit Project Logo
**Endpoint:** `PUT /v1/user/edit/project/logo/<id>`

**Description:** Edit the logo of a specific project.

**Headers:**
- **Authorization** (Required): `Bearer <tokenuser>` - The authentication token granted to the user upon login.

**URL Path:**
- **id** (Required): The ID of the project.

**Request Body:**
```json
{
    "logo": [1, 2, 3, 4]
}
```

**Request Fields:**
- **logo** (Required): Binary data representing the new project logo.

**Response:** (Example)
```json
{
    "msg": "success",
    "data": {
        "project_id": "p-jsXP18DAXN",
        "type": "app",
        "project_name": null,
        "bootcamp_name": null,
        "start_date": null,
        "end_date": null,
        "presentation_date": null,
        "project_description": null,
        "logo_url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/images/projects_logo/p-jsXP18DAXN-logo-17f7ec1c-f65d-4fc9-8c09-6d80dee5a743.png",
        "presentation_url": null,
        "user_id": "80eb1743-a679-47de-a8c4-366b2bd5a96c",
        "admin_id": "0a164eaf-8f34-4fea-9a00-443f1eb05bd9",
        "time_end_edit": "2024-12-11",
        "allow_edit": true,
        "is_public": true,
        "create_at": "2024-08-01T07:38:50.237926",
        "update_at": "2024-08-01T07:39:19.583977",
        "images_project": [],
        "links_project": [],
        "members_project": []
    }
}
```

---

### Edit Project Base
**Endpoint:** `PUT /v1/user/edit/project/base/<id>`

**Description:** Edit the base information of a specific project.

**Headers:**
- **Authorization** (Required): `Bearer <tokenuser>` - The authentication token granted to the user upon login.

**URL Path:**
- **id** (Required): The ID of the project.

**Request Body:**
```json
{
    "project_name": "Amazing Flutter App",
    "bootcamp_name": "Flutter Bootcamp 2024",
    "type": "website",
    "start_date": "15/12/2024",
    "end_date": "15/12/2024",
    "presentation_date": "15/12/2024",
    "project_description": "An amazing Flutter app that revolutionizes user experience."
}
```

**Request Fields:**
- **project_name** (Required): The name of the project.
- **bootcamp_name** (Required): The name of the bootcamp.
- **type** (Required): The type of the project select on of this (app, website, vr, ar, ai, ml, ui/ux, gaming, unity, cyber, software, automation, robotic, api, analytics, iot, cloud).
- **start_date** (Required): The start date of the project.
- **end_date** (Required): The end date of the project.
- **presentation_date** (Required): The presentation date of the project.
- **project_description** (Required): The description of the project.

**Response:** (Example)
```json
{
    "msg": "success",
    "data": {
        "project_id": "p-jsXP18DAXN",
        "type": "website",
        "project_name": "Amazing Flutter App",
        "bootcamp_name": "Flutter Bootcamp 2024",
        "start_date": "2024-12-15",
        "end_date": "2024-12-15",
        "presentation_date": "2024-12-15",
        "project_description": "An amazing Flutter app that revolutionizes user experience.",
        "logo_url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/images/projects_logo/p-jsXP18DAXN-logo-17f7ec1c-f65d-4fc9-8c09-6d80dee5a743.png",
        "presentation_url": null,
        "user_id": "80eb1743-a679-47de-a8c4-366b2bd5a96c",
        "admin_id": "0a164eaf-8f34-4fea-9a00-443f1eb05bd9",
        "time_end_edit": "2024-12-11",
        "allow_edit": true,
        "is_public": true,
        "create_at": "2024-08-01T07:38:50.237926",
        "update_at": "2024-08-01T07:39:52.10589",
        "images_project": [],
        "links_project": [],
        "members_project": []
    }
}
```

---

### Edit Project Presentation
**Endpoint:** `PUT /v1/user/edit/project/presentation/<id>`

**Description:** Edit the presentation file of a specific project.

**Headers:**
- **Authorization** (Required): `Bearer <tokenuser>` - The authentication token granted to the user upon login.

**URL Path:**
- **id** (Required): The ID of the project.

**Request Body:**
```json
{
    "presentation_file": [1, 2, 3, 4]
}
```

**Request Fields:**
- **presentation_file** (Required): Binary data representing the new presentation file.

**Response:** (Example)
```json
{
    "msg": "success",
    "data": {
        "project_id": "p-jsXP18DAXN",
        "type": "website",
        "project_name": "Amazing Flutter App",
        "bootcamp_name": "Flutter Bootcamp 2024",
        "start_date": "2024-12-15",
        "end_date": "2024-12-15",
        "presentation_date": "2024-12-15",
        "project_description": "An amazing Flutter app that revolutionizes user experience.",
        "logo_url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/images/projects_logo/p-jsXP18DAXN-logo-17f7ec1c-f65d-4fc9-8c09-6d80dee5a743.png",
        "presentation_url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/images/projects.pdf/p-jsXP18DAXN-p-4b1bec36-5811-4107-9195-d05b3f36e6da.pdf",
        "user_id": "80eb1743-a679-47de-a8c4-366b2bd5a96c",
        "admin_id": "0a164eaf-8f34-4fea-9a00-443f1eb05bd9",
        "time_end_edit": "2024-12-11",
        "allow_edit": true,
        "is_public": true,
        "create_at": "2024-08-01T07:38:50.237926",
        "update_at": "2024-08-01T07:40:31.032104",
        "images_project": [],
        "links_project": [],
        "members_project": []
    }
}
```

---

### Edit Project Images
**Endpoint:** `PUT /v1/user/edit/project/images/<id>`

**Description:** Edit the images of a specific project.

**Headers:**
- **Authorization** (Required): `Bearer <tokenuser>` - The authentication token granted to the user upon login.

**URL Path:**
- **id** (Required): The ID of the project.

**Request Body:**
```json
{
    "images": [
        [1, 2, 3, 4],
        [1, 2, 3, 4],
        [1, 2, 3, 4]
    ]
}
```

**Request Fields:**
- **images** (Required): List of binary data representing the new project

 images.

**Response:** (Example)
```json
{
    "msg": "success",
    "data": {
        "project_id": "p-jsXP18DAXN",
        "type": "website",
        "project_name": "Amazing Flutter App",
        "bootcamp_name": "Flutter Bootcamp 2024",
        "start_date": "2024-12-15",
        "end_date": "2024-12-15",
        "presentation_date": "2024-12-15",
        "project_description": "An amazing Flutter app that revolutionizes user experience.",
        "logo_url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/images/projects_logo/p-jsXP18DAXN-logo-17f7ec1c-f65d-4fc9-8c09-6d80dee5a743.png",
        "presentation_url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/images/projects.pdf/p-jsXP18DAXN-p-4b1bec36-5811-4107-9195-d05b3f36e6da.pdf",
        "user_id": "80eb1743-a679-47de-a8c4-366b2bd5a96c",
        "admin_id": "0a164eaf-8f34-4fea-9a00-443f1eb05bd9",
        "time_end_edit": "2024-12-11",
        "allow_edit": true,
        "is_public": true,
        "create_at": "2024-08-01T07:38:50.237926",
        "update_at": "2024-08-01T07:41:02.236199",
        "images_project": [
            {
                "id": 2,
                "url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/images/project_images/p-jsXP18DAXN-2-339099dd-d545-40a6-9747-36ce464bdaba.png"
            },
            {
                "id": 1,
                "url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/images/project_images/p-jsXP18DAXN-1-f1bbfd20-6586-44b1-9da5-e1d39946187b.png"
            },
            {
                "id": 3,
                "url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/images/project_images/p-jsXP18DAXN-3-8f4ac033-0036-45cb-b4b8-55d786f4aba9.png"
            }
        ],
        "links_project": [],
        "members_project": []
    }
}
```

---

### Edit Project Links
**Endpoint:** `PUT /v1/user/edit/project/link/<id>`

**Description:** Edit the links of a specific project.

**Headers:**
- **Authorization** (Required): `Bearer <tokenuser>` - The authentication token granted to the user upon login.

**URL Path:**
- **id** (Required): The ID of the project.

**Request Body:**
```json
{
    "link": [
        {"type": "github", "url": "https://github.com/example"},
        {"type": "figma", "url": "https://figma.com/example"},
        {"type": "video", "url": "https://youtube.com/example"},
        {"type": "pinterest", "url": "https://appstore.com/example"},
        {"type": "playstore", "url": "https://appstore.com/example"},
        {"type": "applestore", "url": "https://appstore.com/example"},
        {"type": "apk", "url": "https://appstore.com/example"},
        {"type": "weblink", "url": null}
    ]
}
```

**Request Fields:**
- **link** (Required): An array of objects representing the new project links.
  - **type** (Required): Type of link (e.g., github, figma, video, pinterest, playstore, applestore, apk, weblink).
  - **url** (Required): URL of the link.

**Response:** (Example)
```json
{
    "msg": "success",
    "data": {
        "project_id": "p-jsXP18DAXN",
        "type": "website",
        "project_name": "Amazing Flutter App",
        "bootcamp_name": "Flutter Bootcamp 2024",
        "start_date": "2024-12-15",
        "end_date": "2024-12-15",
        "presentation_date": "2024-12-15",
        "project_description": "An amazing Flutter app that revolutionizes user experience.",
        "logo_url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/images/projects_logo/p-jsXP18DAXN-logo-17f7ec1c-f65d-4fc9-8c09-6d80dee5a743.png",
        "presentation_url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/images/projects.pdf/p-jsXP18DAXN-p-4b1bec36-5811-4107-9195-d05b3f36e6da.pdf",
        "user_id": "80eb1743-a679-47de-a8c4-366b2bd5a96c",
        "admin_id": "0a164eaf-8f34-4fea-9a00-443f1eb05bd9",
        "time_end_edit": "2024-12-11",
        "allow_edit": true,
        "is_public": true,
        "create_at": "2024-08-01T07:38:50.237926",
        "update_at": "2024-08-01T07:41:43.103026",
        "images_project": [
            {
                "id": 2,
                "url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/images/project_images/p-jsXP18DAXN-2-339099dd-d545-40a6-9747-36ce464bdaba.png"
            },
            {
                "id": 1,
                "url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/images/project_images/p-jsXP18DAXN-1-f1bbfd20-6586-44b1-9da5-e1d39946187b.png"
            },
            {
                "id": 3,
                "url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/images/project_images/p-jsXP18DAXN-3-8f4ac033-0036-45cb-b4b8-55d786f4aba9.png"
            }
        ],
        "links_project": [
            {
                "url": "https://github.com/example",
                "type": "github"
            },
            {
                "url": "https://figma.com/example",
                "type": "figma"
            },
            {
                "url": "https://youtube.com/example",
                "type": "video"
            },
            {
                "url": "https://appstore.com/example",
                "type": "pinterest"
            },
            {
                "url": "https://appstore.com/example",
                "type": "playstore"
            },
            {
                "url": "https://appstore.com/example",
                "type": "applestore"
            },
            {
                "url": "https://appstore.com/example",
                "type": "apk"
            },
            {
                "url": null,
                "type": "weblink"
            }
        ],
        "members_project": []
    }
}
```

---

### Edit Project Members
**Endpoint:** `PUT /v1/user/edit/project/members/<id>`

**Description:** Edit the members of a specific project.

**Headers:**
- **Authorization** (Required): `Bearer <tokenuser>` - The authentication token granted to the user upon login.

**URL Path:**
- **id** (Required): The ID of the project.

**Request Body:**
```json
{
    "members": [
        {
            "position": "ui",
            "user_id": "80eb1743-a679-47de-a8c4-366b2bd5a96c"
        },
        {
            "position": "team lead",
            "user_id": "0a164eaf-8f34-4fea-9a00-443f1eb05bd9"
        },
        {
            "position": "Developer",
            "user_id": "a81adc35-426e-4201-a62e-651085e3e512"
        }
    ]
}
```

**Request Fields:**
- **members** (Required): An array of objects representing the new project members.
  - **position** (Required): The position of the user in the project.
  - **user_id** (Required): The ID of the user.

**Response:** (Example)
```json
{
    "msg": "success",
    "data": {
        "project_id": "p-jsXP18DAXN",
        "type": "website",
        "project_name": "Amazing Flutter App",
        "bootcamp_name": "Flutter Bootcamp 2024",
        "start_date": "2024-12-15",
        "end_date": "2024-12-15",
        "presentation_date": "2024-12-15",
        "project_description": "An amazing Flutter app that revolutionizes user experience.",
        "logo_url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/images/projects_logo/p-jsXP18DAXN-logo-17f7ec1c-f65d-4fc9-8c09-6d80dee5a743.png",
        "presentation_url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/images/projects.pdf/p-jsXP18DAXN-p-4b1bec36-5811-4107-9195-d05b3f36e6da.pdf",
        "user_id": "80eb1743-a679-47de-a8c4-366b2bd5a96c",
        "admin_id": "0a164eaf-8f34-4fea-9a00-443f1eb05bd9",
        "time_end_edit": "2024-12-11",
        "allow_edit": true,
        "is_public": true,
        "create_at": "2024-08-01T07:38:50.237926",
        "update_at": "2024-08-01T07:42:04.33511",
        "images_project": [
            {
                "id": 2,
                "url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/images/project_images/p-jsXP18DAXN-2-339099dd-d545-40a6-9747-36ce464bdaba.png"
            },
            {
                "id": 1,
                "url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/images/project_images/p-jsXP18DAXN-1-f1bbfd20-6586-44b1-9da5-e1d39946187b.png"
            },
            {
                "id": 3,
                "url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/images/project_images/p-jsXP18DAXN-3-8f4ac033-0036-45cb-b4b8-55d786f4aba9.png"
            }
        ],
        "links_project": [
            {
                "url": "https://github.com/example",
                "type": "github"
            },
            {
                "url": "https://figma.com/example",
                "type": "figma"
            },
            {
                "url": "https://youtube.com/example",
                "type": "video"
            },
            {
                "url": "https://appstore.com/example",
                "type": "pinterest"
            },
            {
                "url": "https://appstore.com/example",
                "type": "playstore"
            },
            {
                "url": "https://appstore.com/example",
                "type": "applestore"
            },
            {
                "url": "https://appstore.com/example",
                "type": "apk"
            },
            {
                "url": null,
                "type": "weblink"
            }
        ],
        "members_project": [
            {
                "id": "80eb1743-a679-47de-a8c4-366b2bd5a96c",
                "first_name": "mohammed",
                "last_name": "alazmio",
                "email": "hehovik255@maxturns.com",
                "position": "ui",
                "image_url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/users/images/80eb1743-a679-47de-a8c4-366b2bd5a96c-2024-07-31%2022:19:08.634807.png",
                "resume_url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/resume/cv/80eb1743-a679-47de-a8c4-366b2bd5a96c-2024-07-31%2022:19:08.635994-cv.pdf",
                "link": {
                    "github": "https://github.com/fahad0100",
                    "linkedin": "https://www.linkedin.com/in/fahad-alazmi/",
                    "resume": "https://github.com/fahad0100",
                    "bindlink": "https://github.com/fahad0100"
                }
            },
            {
                "id": "0a164eaf-8f34-4fea-9a00-443f1eb05bd9",
                "first_name": "mohammed",
                "last_name": "alazmio",
                "email": "xalap95777@orsbap.com",
                "position": "team lead",
                "image_url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/users/images/0a164eaf-8f34-4fea-9a00-443f1eb05bd9-2024-07-31%2014:25:54.218298.png",
                "resume_url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/resume/cv/0a164eaf-8f34-4fea-9a00-443f1eb05bd9-2024-07-31%2014:25:54.222366-cv.pdf",
                "link": {
                    "github": "https://github.com/fahad0100",
                    "linkedin": "https://www.linkedin.com/in/fahad-alazmi/",
                    "resume": "https://github.com/fahad0100",
                    "bindlink": "https://github.com/fahad0100"
                }
            },
            {
                "id": "a81adc35-426e-4201-a62e-651085e3e512",
                "first_name": "fahad",
                "last_name": "alazmi",
                "email": "vokoka2166@orsbap.com",
                "position": "Developer",
                "image_url": null,
                "resume_url": null,
                "link": {}
            }
        ]
    }
}
```

---

## Administration

### Change User Role
**Endpoint:** `PUT /v1/admin/change/role/user`

**Description:** Change the role of a user.

**Headers:**
- **Authorization** (Required): `Bearer <tokenadmin>` - The authentication token granted to the admin upon login.

**Request Body:**
```json
{
    "id_user": "80eb1743-a679-47de-a8c4-366b2bd5a96c",
    "role": "user"
}
```

**Request Fields:**
- **id_user** (Required): The ID of the user.
- **role** (Required): The new role to be assigned to the user. Should be one of the following: user, admin, supervisor.

**Response:** (Example)
```json
{
    "msg": "success",
    "data": {
        "id": "80eb1743-a679-47de-a8c4-366b2bd5a96c",
        "new_role": "user"
    }
}
```

---

## Supervisor

### Create Project
**Endpoint:** `POST /v1/supervisor/create/project`

**Description:** Create a new project.

**Headers:**
- **Authorization** (Required): `Bearer <tokensupervisor>` - The authentication token granted to the supervisor upon login.

**Request Body:**
```json
{
    "user_id": "80eb1743-a679-47de-a8c4-366b2bd5a96c",
    "time_end_edit": "31/12/2024",
    "edit": "false"
}
```

**Request Fields:**
- **user_id** (Required): The ID of the user.
- **time_end_edit** (Required): The end time for editing the project.
- **edit** (Required): A boolean value indicating whether editing is allowed.

**Response:** (Example)
```json
{
    "msg": "success",
    "data": {
        "project_id": "p-jsXP18DAXN",
        "project_name": null,
        "bootcamp_name": null,
        "start_date": null,
        "end_date": null,
        "presentation_date": null,
        "project_description": null,
        "logo_url": null,
        "presentation_url": null,
        "user_id": "80eb1743-a679-47de-a8c4-366b2bd5a96c",
        "admin_id": "0a164eaf-8f34-4fea-9a00-443f1eb05bd9",
        "time_end_edit": "2024-12-31",
        "allow_edit": false,
        "is_public": false,
        "create_at": "2024-08-01T07:38:50.237926",
        "update_at": null,
        "type": "app",
        "images_project": [],
        "links_project": [],
        "members_project": []
    }
}
```

---

### Change Project Status
**Endpoint:** `PUT /v1/supervisor/change/status/<id>`

**Description:** Change the status of a project.

**Headers:**
- **Authorization** (Required): `Bearer <tokensupervisor>` - The authentication token granted to the supervisor upon login.

**URL Path:**
- **id** (Required): The ID of the project.

**Request Body:**
```json
{
    "time_end_edit": "11/12/2024",
    "edit": true,
    "public": true
}
```

**Request Fields:**
- **time_end_edit** (Required): The end time for editing the project.
- **edit** (Required): A boolean value indicating whether editing is allowed.
- **public** (Required): A boolean value indicating whether the project is public.

**Response:** (Example)
```json
{
    "msg": "success",
    "data": {
        "project_id": "p-jsXP18DAXN",
        "type": "app",
        "project_name": null,
        "bootcamp_name": null,
        "start_date": null,
        "end_date": null,
        "presentation_date": null,
        "project_description": null,
        "logo_url": null,
        "presentation_url": null,
        "user_id": "80eb1743-a679-47de-a8c4-366b2bd5a96c",
        "admin_id": "0a164eaf-8f34-4fea-9a00-443f1eb05bd9",
        "time_end_edit": "2024-12-11",
        "allow_edit": true,
        "is_public": true,
        "create_at": "2024-08-01T07:38:50.237926",
        "update_at": "2024-08-01T07:39:12.823134",
        "images_project": [],
        "links_project": [],
        "members_project": []
    }
}
```

---

### Delete Project
**Endpoint:** `DELETE /v1/supervisor/delete/project/<id>`

**Description:** Delete a project.

**Headers:**
- **Authorization** (Required): `Bearer <tokensupervisor>` - The authentication token granted to the supervisor upon login.

**URL Path:**
- **id** (Required): The ID of the project.

**Response:** (Example)
```json
{
    "msg": "success",
    "data": "Project has id: (p-Ge8oNRPiG7) is deleted successfully"
}
```

---

## Public

### Get Project
**Endpoint:** `GET /v1/project/<id>`

**Description:** Retrieve the details of a project.

**URL Path:**
- **id** (Required): The ID of the project.

**Response:** (Example)
```json
{
    "msg": "success",
    "data": {
        "project_id": "p-Ge8oNRPiG7",
        "type": "app",
        "project_name": "Amazing Flutter App",
        "bootcamp_name": "Flutter Bootcamp 2024",
        "start_date": "2024-12-15",
        "end_date": "2024-12-15",
        "presentation_date": "2024-12-15",
        "project_description": "An amazing Flutter app that revolutionizes user experience.",
        "logo_url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/images/projects_logo/p-Ge8oNRPiG7-logo-305652de-535d-44d5-b73f-5f8793d0dcfc.png",
        "presentation_url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/images/projects.pdf/p-Ge8oNRPiG7-p-c5611490-0f79-428e-88f1-1ba77620d8b9.pdf",
        "user_id": "80eb1743-a679-47de-a8c4-366b2bd5a96c",
        "admin_id": "0a164eaf-8f34-4fea-9a00-443f1eb05bd9",
        "time_end_edit": "2024-12-11",
        "allow_edit": true,
        "is_public": true,
        "create_at": "2024-07-31T12:43:57.968599",
        "update_at": "2024-07-31T17:43:28.226911",
        "images_project": [
            {
                "id": 3,
                "url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/images/project_images/p-Ge8oNRPiG7-3-a5ddc0bc-05b7-45e9-8c5c-909df475c22f.png"
            },
            {
                "id": 2,
                "url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/images/project_images/p-Ge8oNRPiG7-2-b241287c-9fc5-4ea8-b276-ab90553aa805.png"
            },
            {
                "id": 1,
                "url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/images/project_images/p-Ge8oNRPiG7-1-70b20221-1e82-403e-b486-b3fa5663ce96.png"
            }
        ],
        "links_project": [
            {
                "url": "https://github.com/example",
                "type": "github"
            },
            {
                "url": "https://figma.com/example",
                "type": "figma"
            },
            {
                "url": "https://youtube.com/example",
                "type": "video"
            },
            {
                "url": "https://appstore.com/example",
                "type": "pinterest"
            },
            {
                "url": "https://appstore.com/example",
                "type": "playstore"
            },
            {
                "url": "https://appstore.com/example",
                "type": "applestore"
            },
            {
                "url": "https://appstore.com/example",
                "type": "apk"
            },
            {
                "url": null,
                "type": "weblink"
            }
        ],
        "members_project": [
            {
                "id": "80eb1743-a679-47de-a8c4-366b2bd5a96c",
                "first_name": "mohammed",
                "last_name": "alazmio",
                "email": "hehovik255@maxturns.com",
                "position": "ui",
                "image_url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/users/images/80eb1743-a679-47de-a8c4-366b2bd5a96c-2024-07-31%2016:33:45.510764.png",
                "resume_url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/resume/cv/80eb1743-a679-47de-a8c4-366b2bd5a96c-2024-07-31%2016:33:45.511639-cv.pdf",
                "user_account": {
                    "github": "https://github.com/fahad0100",
                    "linkedin": "https://www.linkedin.com/in/fahad-alazmi/",
                    "resume": "https://github.com/fahad0100",
                    "bindlink": "https://github.com/fahad0100"
                }
            },
            {
                "id": "0a164eaf-8f34-4fea-9a00-443f1eb05bd9",
                "first_name": "mohammed",
                "last_name": "alazmio",
                "email": "xalap95777@orsbap.com",
                "position": "Developer",
                "image_url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/users/images/0a164eaf-8f34-4fea-9a00-443f1eb05bd9-2024-07-31%2014:25:54.218298.png",
                "resume_url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/resume/cv/0a164eaf-8f34-4fea-9a00-443f1eb05bd9-2024-07-31%2014:25:54.222366-cv.pdf",
                "user_account": {
                    "github": "https://github.com/fahad0100",
                    "linkedin": "https://www.linkedin.com/in/fahad-alazmi/",
                    "resume": "https://github.com/fahad0100",
                    "bindlink": "https://github.com/fahad0100"
                }
            },
            {
                "id": "a81adc35-426e-4201-a62e-651085e3e512",
                "first_name": "fahad",
                "last_name": "alazmi",
                "email": "vokoka2166@orsbap.com",
                "position": "Developer",
                "image_url": null,
                "resume_url": null,
                "user_account": {}
            }
        ]
    }
}
```

---

### Search Projects
**Endpoint:** `GET /v1/search/projects`

**Description:** Search for projects based on specific criteria.

**URL Parameters:**
- **name** (Optional): The name of the project.
- **to** (Optional): The upper limit for the search range.
- **from** (Optional): The lower limit for the search range.
- **bootcamp** (Optional): The name of the bootcamp.
- **type** (Optional): The type of the project.

**Example URLs:**
- `GET /v1/search/projects`: Retrieve the last 100 projects.
- `GET /v1/search/projects?name=Amazing`: Retrieve all projects containing the word "Amazing" in their name.
- `GET /v1/search/projects?name=Amazing&from=1&to=2`: Retrieve the last 2 projects containing the word "Amazing" in their name.
- `GET /v1/search/projects?name=Amazing&from=1&to=2&bootcamp=flutter`: Retrieve the last 2 projects containing the word "Amazing" in their name and the word "flutter" in the bootcamp name.
- `GET /v1/search/projects?name=Amazing&from=1&to=2&bootcamp=App&type=website`: Retrieve the last 2 projects containing the word "Amazing" in their name, the word "App" in the bootcamp name, and of type "website".

**Response:** (Example)
```json
{
    "msg": "success",
    "data": {
        "count": 1,
        "projects": [
            {
                "project_id": "p-7IKLodojYY",
                "type": "website",
                "project_name": "Amazing Flutter App",
                "bootcamp_name": "Flutter Bootcamp 2024",
                "start_date": "2024-12-15",
                "end_date": "2024-12-15",
                "presentation_date": "2024-12-15",
                "project_description": "An amazing Flutter app that revolutionizes user experience.",
                "logo_url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/images/projects_logo/p-7IKLodojYY-logo-5914b0be-1fcd-45b3-9217-008e8dc4317e.png",
                "presentation_url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/images/projects.pdf/p-7IKLodojYY-p-a18daefb-0276-4ff2-a6d3-45000d4863af.pdf",
                "user_id": "80eb1743-a679-47de-a8c4-366b2bd5a96c",
                "admin_id": "0a164eaf-8f34-4fea-9a00-443f1eb05bd9",
                "time_end_edit": "2024-12-11",
                "allow_edit": true,
                "is_public": true,
                "create_at": "2024-07-31T12:56:20.692437",
                "update_at": "2024-07-31T17:43:28.226911",
                "images_project": [
                    {
                        "id": 1,
                        "url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/images/project_images/p-7IKLodojYY-1-493232b8-ef65-4106-873c-888451e28a05.png"
                    },
                    {
                        "id": 2,
                        "url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/images/project_images/p-7IKLodojYY-2-fee38f00-bf90-48e0-8762-8290b2220947.png"
                    },
                    {
                        "id": 3,
                        "url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/images/project_images/p-7IKLodojYY-3-7d06d21f-9fff-4628-8f43-27bd54289300.png"
                    }
                ],
                "links_project": [
                    {
                        "url": "https://github.com/example",
                        "type": "github"
                    },
                    {
                        "url": "https://figma.com/example",
                        "type": "figma"
                    },
                    {
                        "url": "https://youtube.com/example",
                        "type": "video"
                    },
                    {
                        "url": "https://appstore.com/example",
                        "type": "pinterest"
                    },
                    {
                        "url": "https://appstore.com/example",
                        "type": "playstore"
                    },
                    {
                        "url": "https://appstore.com/example",
                        "type": "applestore"
                    },
                    {
                        "url": "https://appstore.com/example",
                        "type": "apk"
                    },
                    {
                        "url": null,
                        "type": "weblink"
                    }
                ],
                "members_project": [
                    {
                        "id": "80eb1743-a679-47de-a8c4-366b2bd5a96c",
                        "first_name": "mohammed",
                        "last_name": "alazmio",
                        "email": "hehovik255@maxturns.com",
                        "position": "ui",
                        "image_url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/users/images/80eb1743-a679-47de-a8c4-366b2bd5a96c-2024-07-31%2016:33:45.510764.png",
                        "resume_url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/resume/cv/80eb1743-a679-47de-a8c4-366b2bd5a96c-2024-07-31%2016:33:45.511639-cv.pdf",
                        "user_account": {
                            "github": "https://github.com/fahad0100",
                            "linkedin": "https://www.linkedin.com/in/fahad-alazmi/",
                            "resume": "https://github.com/fahad0100",
                            "bindlink": "https://github.com/fahad0100"
                        }
                    },
                    {
                        "id": "0a164eaf-8f34-4fea-9a00-443f1eb05bd9",
                        "first_name": "mohammed",
                        "last_name": "alazmio",
                        "email": "xalap95777@orsbap.com",
                        "position": "Developer",
                        "image_url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/users/images/0a164eaf-8f34-4fea-9a00-443f1eb05bd9-2024-07-31%2014:25:54.218298.png",
                        "resume_url": "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/resume/cv/0a164eaf-8f34-4fea-9a00-443f1eb05bd9-2024-07-31%2014:25:54.222366-cv.pdf",
                        "user_account": {
                            "github": "https://github.com/fahad0100",
                            "linkedin": "https://www.linkedin.com/in/fahad-alazmi/",
                            "resume": "https://github.com/fahad0100",
                            "bindlink": "https://github.com/fahad0100"
                        }
                    },
                    {
                        "id": "a81adc35-426e-4201-a62e-651085e3e512",
                        "first_name": "fahad",
                        "last_name": "alazmi",
                        "email": "vokoka2166@orsbap.com",
                        "position": "Developer",
                        "image_url": null,
                        "resume_url": null,
                        "user_account": {}
                    }
                ]
            }
        ]
    }
}
```

---

# CustomerManage Web Application

## Overview

This project was developed as part of a corporate training program (企業実習) by a team of four, including myself. It is a web application designed to manage personal information of customers, such as name, address, phone number, and email, leveraging an Oracle database for backend storage. The application supports various user roles, enabling different levels of access and permissions, including viewing, editing, creating, and deleting customer and user records. Logical deletion is used to safely remove records, ensuring that data is never physically erased from the database.

## Features

- **Customer Information Management**: Enables the creation, viewing, editing, and deletion of customer personal information.
- **User Role Management**: Provides different levels of access based on user roles, ranging from viewing information to complete management capabilities.
- **Logical Deletion**: Ensures safe removal of records without permanently losing data.

## Technical Setup

- **Project Exported from Eclipse EE**: The project is organized into four main folders, with the `CustomerManage (Project)` folder containing the primary application files.
- **Database**: Requires setup of an Oracle database.
- **Server**: Configured to run on a local Tomcat server, version 8.5.
- **IDE Configuration**: Detailed instructions are provided for configuring the Eclipse IDE environment, including database and server integration.

## Installation

1. Navigate to the `CustomerManage (Project)` folder and import the project into Eclipse EE.
2. Follow the environment setup instructions in the `環境設定` folder to configure the Oracle database and Tomcat server within Eclipse.
3. For detailed setup and functionality guidelines, refer to the specification documents (`仕様書`) provided.

## Testing

This project includes a comprehensive suite of black-box tests, designed and executed in accordance with the project requirements. All outcomes and observations are meticulously documented in the `ブラックボックステスト` folder.

## Documentation

All necessary documentation, including project specifications (`仕様書`) and test plans, is located within their respective folders. Internal notes and coordination records have been omitted for privacy and relevance.

## License

With explicit consent from the supervising professor for educational purposes, this project is released under the MIT License.

## Acknowledgements

Special thanks to my team members and supervising professor for their guidance and support throughout the development and testing phases of this project.

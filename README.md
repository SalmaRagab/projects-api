# Projects API

## How to run?
```sh
docker-compose up
```
Server will be running on ```http://localhost:3000```

## Endpoints implemented and how to test?
- Refer to this [postman collection](./ProjectsAPI.postman_collection.json)

## Project structure
- Controllers:
    - One controller handling `get`, `create`, `update`, `(un)assign participants` endpoints, using the ProjectService
- Services:
    - EmployeeService: Handles the external API call to the employees endpoint
    - ProjectService: Acts as a middle layer that could handle the business logic away from the controller and the database queries
- Repositories:
    - ProjectRepository: Acts as a middle layer between the service and the database, to make the database layer detachable from other project layers (This will make it easier in the future if we had to change the database used)
- Models:
    - There are two models (`Project` and `ProjectParticipants`), the relation between them is many to many
    
        [Projects **--->** ProjectParticipants **<---** Employees(from API)]
    - Validations handled:
        - Project must have [name, state and owner_id]
        - Project name must have number of characters <= 255 
        - Owner id must be a valid employee id and his role is "_manager_"
        - Participant id must be a valid employee id and his role is "_employee_"
        - Uniqeness of participant on the project scope
## Future improvements
- Response errors handling, reasonable status codes and messages
- Pagination for retrieving the projects, to avoid retrieving all of the projects in one request
- Add logging using gems like [acts_as_paranoid](https://rubygems.org/gems/acts_as_paranoid/versions/0.4.3) and [paper_trail](https://rubygems.org/gems/paper_trail/versions/11.0.0)
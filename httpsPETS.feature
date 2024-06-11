Feature: TESTEO SOFKA 2

Scenario:|
    Given url 'https://petstore.swagger.io/'
    When header 'Content -Type' = 'Application/json'
    
    
Feature: Pruebas de usuarios en la API PetStore

Background:
  * baseUrl = 'https://petstore.swagger.io/'
  * user =
   {
      "username": "usuario_prueba",
      "firstName": "Juan",
      "lastName": "Pérez",
      "email": "usuario_prueba@correo.com",
      "password": "contraseña123",
      "phone": "+593 987654321",
      "userStatus": 0
    }


  2. Crear un usuario:


Scenario: Crear un usuario
  * post '/user' with user
  * status 200
  * json response.id = userId

3. Buscar el usuario creado:


Scenario: Buscar el usuario creado
  * get '/user/{userId}'
  * status 200
  * json response == user
Usa el código con precaución.
content_copy
4. Actualizar el nombre y el correo del usuario:


Scenario: Actualizar el nombre y el correo del usuario
  * put '/user/{userId}' with 
  {
      "firstName": "Pedro",
      "email": "usuario_actualizado@correo.com"
  }
  * status 200
  * json user.firstName = "Pedro"
  * json user.email = "usuario_actualizado@correo.com"

5. Buscar el usuario actualizado:

Scenario: Buscar el usuario actualizado
  * get '/user/{userId}'
  * status 200
  * json response == user

6. Eliminar el usuario:

JavaScript
Scenario: Eliminar el usuario
  * delete '/user/{userId}'
  * status 200
  * json response.message == "User deleted"
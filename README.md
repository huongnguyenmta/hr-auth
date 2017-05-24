# Rails Integration with [OmniAuth HrSystem](https://github.com/dieunb/omniauth-hrsystem)


# Web Applications Code Flow
Direct users to

```
https://auth.framgia.vn/authenticate
    ?client_id=YOUR_CLIENT_ID
    &response_type=code
    &redirect_uri=YOUR_REGISTERED_REDIRECT_URI
```
(generally done through a link or button)
If the user accepts, they will be redirected back to
    https://YOUR_REGISTERED_REDIRECT_URI/?code=CODE

Your server should exchange the code it got in step 2 for an access token. Make a request for
https://auth.framgia.vn/access_token
    ?client_id=YOUR_CLIENT_ID
    &client_secret=YOUR_CLIENT_SECRET
    &grant_type=authorization_code
    &redirect_uri=YOUR_REGISTERED_REDIRECT_URI
    &code=CODE

The response will be JSON
{ access_token: ACCESS_TOKEN }

Save this access token for this user in your database.
Web Applications Token Flow

Client applications
If you have no substantive server code, you can use the token flow outlined below.

Redirect users who wish to authenticate to
https://auth.framgia.vn/authenticate
    ?client_id=CLIENT_ID
    &response_type=token
    &redirect_uri=YOUR_REGISTERED_REDIRECT_URI

If a user accepts, they will be redirected back to
https://YOUR_REGISTERED_REDIRECT_URI/#access_token=ACCESS_TOKEN

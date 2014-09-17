'use strict'

class Account

  PARAMS:
    AccountId: '890423234739'
    RoleArn: 'arn:aws:iam::890423234739:role/Cognito_noteUnauth_DefaultRole'
    IdentityPoolId: 'us-east-1:735704f2-6054-4700-a851-0bb1c573ff3e'

  constructor: ->
    document.querySelector('#account')?.addEventListener 'click', (event) =>
      id = event.target.id.split '-'
      if id.length is 2 and id[0] is 'signin'
        @signin id[1]

  signin: (site) ->
    AWS.config.region = 'us-east-1'
    AWS.config.credentials = new AWS.CognitoIdentityCredentials @PARAMS

    AWS.config.credentials.get (err) ->
	    if !err
        console.log "Cognito Identity Id: " + AWS.config.credentials.identityId
      else
        console.log "Error: " + err

    cognitoSyncClient = new AWS.CognitoSync()
    cognitoSyncClient.listDatasets {
      IdentityId: AWS.config.credentials.identityId
      IdentityPoolId: "YOUR_COGNITO_IDENTITY_POOL_ID"
    }, (err, data) ->
      if !err
        console.log JSON.stringify data


window.Account = Account

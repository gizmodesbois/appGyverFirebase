angular.module('common')
.service 'firebaseIO', ($firebaseObject, $firebaseArray) ->

  firebaseLocation = new Firebase("https://samchat.firebaseio.com")
  messagesLocation = new Firebase("https://samchat.firebaseio.com/messages")
  usersLocation = new Firebase("https://samchat.firebaseio.com/")
  connectedLocation = new Firebase("https://samchat.firebaseio.com//.info/connected")

  messages = $firebaseArray(messagesLocation)
  userList = $firebaseArray(usersLocation)

  {
    syncMessages : () ->
      messages
    sendMessage : (messageInformations) ->
      messages.$add messageInformations
    userListRef : () ->
      usersLocation.push()
    syncUsers : () ->
      usersLocation
    connectedRef : () ->
      connectedLocation
    userList : () ->
      userList
  }

angular
  .module('firebaseModule')
  .controller 'IndexController', ($scope, supersonic, firebaseIO, userBuilder) ->
    currentStatus = "online"

    $scope.messages = firebaseIO.syncMessages()

    userListRef = firebaseIO.syncUsers()

    $scope.user = userBuilder.build()

    myUserRef = firebaseIO.userListRef()

    connectedRef = firebaseIO.connectedRef()

    $scope.connectedUsers = firebaseIO.userList()

    setUserStatus = (status) ->
      # Set our status in the list of online users.
      currentStatus = status
      myUserRef.set
        name: $scope.user.uuid
        uuid: $scope.user.uuid
        avatar: $scope.user.avatar
        status: status
      return


    connectedRef.on 'value', (isOnline) ->
      if isOnline.val()
        myUserRef.onDisconnect().remove()
        setUserStatus 'online'
        return
      else
        setUserStatus currentStatus
        return

    document.onIdle = ->
      setUserStatus 'idle'
      return

    document.onAway = ->
      setUserStatus 'away'
      return

    document.onBack = (isIdle, isAway) ->
      setUserStatus 'online'
      return

    setIdleTimeout 5000
    setAwayTimeout 10000

    $scope.submitMessage = () ->
      messageInformations =
        uuid: $scope.user.uuid
        color: $scope.user.color
        avatar: $scope.user.avatar
        text: $scope.messageForm.text
        timestamp: Firebase.ServerValue.TIMESTAMP
      firebaseIO.sendMessage messageInformations
      $scope.messageForm.text = ''

    $scope.formattedTimeStamp = (timestamp) ->
      moment(timestamp).fromNow()

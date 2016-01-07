
#AccountsTemplates.configureRoute 'signIn', {
  #name: 'signin',
  #path:'/signIn',
  #redirect: '/',
  #template: 'entry',

AccountsTemplates.configure {
  confirmPassword: true,
  enablePasswordChange: true,
  forbidClientAccountCreation: false,
  overrideLoginErrors: false,
  sendVerificationEmail: true,
  lowercaseUsername: false,

  # Appearance
  showAddRemoveServices: true,
  showForgotPasswordLink: true,
  showLabels: true,
  showPlaceholders: true,

  # Client-side Validation
  continuousValidation: true,
  negativeFeedback: false,
  negativeValidation: true,
  positiveValidation: true,
  positiveFeedback: true,
  showValidating: true,

  # Privacy Policy and Terms of Use
  privacyUrl: 'privacy',
  termsUrl: 'terms-of-use',

  ## Redirects
  defaultLayout: 'layout',
  defaultLayoutRegions: {},
  defaultContentRegion: 'main'
  #redirectTimeout: 4000,

  # Hooks
  #onLogoutHook: myLogoutFunc,
  #preSignUpHook: ( password, info )->
    #console.log "Presign up!"
    #console.log password
    #console.log info

  #onSubmitHook: (error, action, final) ->
    #console.log "Submit hook!"
    #user = Meteor.user()
    #if !error
      #Router.go "/"
}

AccountsTemplates.removeField "email"
pwd = AccountsTemplates.removeField "password"

AccountsTemplates.addField {
  _id : "email"
  type: "email"
  placeholder: {
    signUp: "Only users with noorahealth.org email addresses can access"
  }
  required: true
  re: /.+@noorahealth.org\b/
}

AccountsTemplates.addField(pwd)

AccountsTemplates.configureRoute('changePwd')
AccountsTemplates.configureRoute('forgotPwd')
AccountsTemplates.configureRoute('resetPwd')
AccountsTemplates.configureRoute('signIn')
AccountsTemplates.configureRoute('signUp')
#AccountsTemplates.configureRoute('verifyEmail');
FlowRouter.triggers.enter [AccountsTemplates.ensureSignedIn]

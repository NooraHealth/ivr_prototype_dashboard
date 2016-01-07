FlowRouter.route '/', {
  name: 'home'
  action: ()->
    console.log "In the flow router route"
    BlazeLayout.render 'layout', { main: 'patients' }
}



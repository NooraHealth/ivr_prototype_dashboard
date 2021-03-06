Template.patients.helpers
  humanReadableDate: ( date )->
    if not date
      return ""
    return moment(date).format "MMM D YYYY hh:mm"

  patients: ()->
    return Patients.find {}, { sort: { date_added: -1 }}

Template.patients.events
  "change input[name=placedInSystem]": ( e )->
    console.log "CHANGE"
    placed = $(e.target).is ":checked"
    console.log placed
    Patients.update { _id: @._id }, { $set: { has_been_input_to_ivr_system: placed }}

  "click #logout": ()->
    console.log "logging out"
    Meteor.logout( ()->
      FlowRouter.go '/sign-in'
    )


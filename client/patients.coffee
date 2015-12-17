Template.patients.helpers
  humanReadableDate: ( date )->
    if not date
      return ""
    return moment(date).format "MMM D YYYY hh:mm"

  patients: ()->
    console.log "Patients"
    console.log Patients
    #return Patients.find { $and: [ {subscribes_to_ivr: true} , { has_been_input_to_ivr_system: false}] } , { sort: { date_added: -1 }}
    return Patients.find {}

  #inSystem: ()->
    #return Patients.find { $and: [ { subscribes_to_ivr: true } , { has_been_input_to_ivr_system: true }]}, {sort: { date_added: -1 }}

  #notSubscribed: ()->
    #return Patients.find { subscribes_to_ivr: false }, {sort: { date_added: -1 }}

Template.patients.events
  "change input[name=placedInSystem]": ( e )->
    console.log "CHANGE"
    placed = $(e.target).is ":checked"
    console.log placed
    Patients.update { _id: @._id }, { $set: { has_been_input_to_ivr_system: placed }}


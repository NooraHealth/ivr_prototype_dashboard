Template.patients.helpers
  patients: ()->
    console.log "Patients"
    console.log Patients
    return Patients.find { $and: [ {subscribes_to_ivr: true} , { has_been_input_to_ivr_system: false}] }

  inSystem: ()->
    return Patients.find { $and: [ { subscribes_to_ivr: true } , { has_been_input_to_ivr_system: true }]}

  notSubscribed: ()->
    return Patients.find { subscribes_to_ivr: false }

Template.patients.events
  "change input[name=placedInSystem]": ( e )->
    console.log "CHANGE"
    placed = $(e.target).is ":checked"
    console.log placed
    Patients.update { _id: @._id }, { $set: { has_been_input_to_ivr_system: placed }}

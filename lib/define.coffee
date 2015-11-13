
this.Patients = new Mongo.Collection Meteor.settings.public.patients_collection

Patients.helpers
  dateAdded: ()->
    date = @.date_added
    console.log date
    if not date
      return "undefined"
    return moment(date).format "MMM D YYYY hh:mm"


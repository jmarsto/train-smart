export default class makeShitUp {
  constructor(the, things) {
    this.the = the
    this.things = things
  }

  updatePhases() {
    updateSourceDay()
  }

  doThings(with, things) {
    return(
      things + with
    )
  }
}


let poop = new makeShitUp(the, things)
poop.doThings(with, things)

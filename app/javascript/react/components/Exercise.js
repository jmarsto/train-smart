import React, { Component } from 'react';
import ReactModal from 'react-modal';
ReactModal.setAppElement('#app');

class Exercise extends Component {
  constructor(props) {
    super(props);
    this.state = {
      hover: false,
      showModal: false
    };
    this.enter = this.enter.bind(this)
    this.leave = this.leave.bind(this)
    this.handleOpenModal = this.handleOpenModal.bind(this);
    this.handleCloseModal = this.handleCloseModal.bind(this);
  }

  handleOpenModal () {
    this.setState({ showModal: true });
  }

  handleCloseModal () {
    this.setState({ showModal: false });
  }


  enter() {
    this.setState({ hover: true })
  }

  leave() {
    this.setState({ hover: false })
  }

  render() {
    let splitDescription = this.props.description.split('\n')
    let showDescription = splitDescription.map(section => {
      return(
          <p>{section}</p>
      )
    })
    return(
      <div className="exercise" onMouseEnter={this.enter} onMouseLeave={this.leave}>
        <span>{this.props.name}</span>
        {this.state.hover &&
          <span className="info-icon" onClick={this.handleOpenModal}><i className="fa fa-info-circle" aria-hidden="true"></i></span>}
        <ReactModal
          isOpen={this.state.showModal}
          contentLabel="modal"
          onRequestClose={this.handleCloseModal}
          shouldCloseOnOverlayClick={true}
          shouldCloseOnEsc={true}
          className="modal"
        >
          {showDescription}
        </ReactModal>
        <br />
      </div>
    )
  }
}

export default Exercise;

class TourPack extends React.Component {
  getInitialState () {
    return (
      JSON.parse(this.props.presenter)
    ) 
  }
  render() {
    return (
      <div className="tour-box">
        <TourPackageList tour_packages={ this.state } />
        <hr />
      </div>
    )
  }
}
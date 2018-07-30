var TourPackageList = createReactClass({
  render: function () {
    var tourPackageNodes = this.props.tour_packages.map(function ( tour_package ) {
      return <Package name={ tour_package.name } age_from={ tour_package.age_from } age_upto={ tour_package.age_upto } max_people={ tour_package.max_people } cost_per_person={ tour_package.cost_per_person } last_submission_date={ tour_package.last_submission_date } key={ tour_package.id } />
    });

    return (
      <div className="tour-package-list">
        { tourPackageNodes }
      </div>
    )
  }
});
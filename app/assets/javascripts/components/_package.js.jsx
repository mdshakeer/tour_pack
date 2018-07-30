var Package = createReactClass({
  render: function () {
    return (
      <div>
        <div>{ this.props.name } </div>
        <div>{ this.props.age_from }</div>
        <div>{ this.props.age_upto } </div>
        <div>{ this.props.max_people }</div>
        <div>{ this.props.cost_per_person } </div>
        <div>{ this.props.last_submission_date }</div>
      </div>
    )
  }
});
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import App from '../components/App'
import * as Actions from '../actions'

function mapStateToProps(state) {
    //console.log("AppConnector mapStatetoprops(state) state=%o, state.note=%o", state, state.note)
    return {
	//note: state.note
    }
}

function mapDispatchToProps(dispatch) {
    //console.log("AppConnector mapDispatchtoprops(dispatch) Actions=%o", Actions)
    return bindActionCreators(Actions, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(App)



## Visualyze Walkthrough Notes

Understand:
- How to check things on the window (actions, AJAX, etc)

Routes:
- I set up everything under an api namespace:
	namespace :api, defaults: {format: :json} do
  		resources :pokemon
	end

Set up frontend:
- Npm init -y (to initialize a package.json) then nom install —save lots of packages
- Create webpack.config.js in root of project and copy paste in code
- Create a .jsx entry file
- Run web pack —watch to generate bundle.js
- Create frontend folders
- Export default or export everything!

Entry file:
import React from 'react';
import ReactDOM from 'react-dom';
import {receiveArtworks, fetchArtworks, fetchArtwork} from './actions/artwork_actions';
import configureStore from './store/store';
import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
	  let store;
 	 if (window.currentUser) {
   	 const preloadedState = { session: { currentUser: 		window.currentUser } };
    	store = configureStore(preloadedState);
   	 delete window.currentUser;
	  } else {
 	   store = configureStore();
 	 }
  	const root = document.getElementById('root');
  	ReactDOM.render(<Root store={store} />, root);
	});


API_Util:
- Export, fat arrow function that returns an Ajax call
- The URL is found using rake routes
	export const fetchSinglePokemon = id => (
	  $.ajax({
	    method: 'GET',
	    url: `api/pokemon/${id}`
	  })
	);
- React native uses fetch
export const fetchTranscription = (id) => (
  fetch(`http://127.0.0.1:8000/transcriptions/${id}/`, {
    method: 'GET',
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    },
  })
);

Action creators:
- Synchronous:
	export const DESTROY_TRANSCRIPTION = 	'DESTROY_TRANSCRIPTION';

	export const destroyTranscription = transcription => ({
  		type: DESTROY_TRANSCRIPTION,
 		transcription
	});
- Async:

React Native:
export const deleteTranscription = (transcription) => dispatch => {
  return TranscriptionAPIUtil.deleteTranscription(transcription)
  .then(resp => resp.json())
  .then(json => dispatch(destroyTranscription(json))
  );
};

React:
export const deleteArtwork = (artwork) => dispatch => {
  return ArtworkAPIUtil.deleteArtwork(artwork).then(
    artwork2 => dispatch(destroyArtwork(artwork2))
  );
};

Reducers:
- Create const, fat arrow function that returns default state (an object);
- Import actions
const TranscriptionsReducer = (state=defaultState(), action) => {
  Object.freeze(state);
  let nextState;
  switch (action.type) {
    case RECEIVE_TRANSCRIPTION:
      const transcription = action.transcription;
      let newMerged = merge({},state);
      newMerged.currentTranscription = action.transcription;
      return newMerged;
    case RECEIVE_TRANSCRIPTIONS:
      const transcriptions2 = action.transcriptions;
      return merge({}, defaultState(), {transcriptions: transcriptions2});
    case DESTROY_TRANSCRIPTION:
      nextState = merge({},state);
      delete nextState.transcriptions[action.transcription.pk];
      return nextState;
    default:
      return state;
  }
};


Store:
	import { createStore, applyMiddleware } from 'redux';
	import thunk from 'redux-thunk';
	import logger from 'redux-logger';
	import RootReducer from '../reducers/root_reducer';

	const configureStore = () => (
	  createStore(RootReducer, applyMiddleware(thunk, logger))
	);

	export default configureStore;

Container:
import {connect} from 'react-redux';
import TranscriptionEdit from './transcription_edit';
import { updateTranscription, fetchTranscription }
  from '../../actions/transcription_actions';

const mapStateToProps = (state) => ({
  currentTranscription: state.transcriptions.currentTranscription
});

const mapDispatchToProps = (dispatch) => ({
  updateTranscription: (transcription) => dispatch(updateTranscription(transcription)),
  fetchTranscription: (id) => dispatch(fetchTranscription(id)),
});

export default connect(mapStateToProps,mapDispatchToProps)(TranscriptionEdit);

Component:
- Import React from ‘react’
class TranscriptionEdit extends React.Component {
  constructor(props) {
super(props)
this.state = {};
}

render() {}
	return (
	<.  >
)
}
Export default TranscriptionEdit;


### General Rails Backend/React and Redux Frontend
- Npm = package mgr for javascript

Ruby on Rails on the backend
- Schema - database setup
- Models
- Controllers
    - Methods associated with the controller
- Routes - define the routes to map a specific URL to one of the methods in the controllers
    - These are RESTful routes
- Views - jbuilder files
    - Uses the ruby jbuilder gem to make specific fields available in a son format, so that I can then use them on the frontend to expose this data
Frontend
- Store
    - configureStore returns a new store, taking in the root reducer, preloaded state, and middleware
- Entry file - Calls Root file, passes in store
- Root -
    - Wraps App component in Provider - which is a react component that provides the store to all of its child components
    - Also wrap in HashRouter, wraps child components to give routing information
- App - has all the routes
- Util folder
    - Functions that’ll be used by the thunk action creators that dispatches an Ajax request and returns a promise
- Actions
    - Actions
    - Thunk action creators - returns a thunk that calls the API Utils and dispatches an action
- Reducers
    - Updates specific slices of state when it receives actions
    - All reducers are added to the root reducer- and this shows what the overall state looks like
- Components
    - A lot of containers, which uses Connect - maps the store’s state and dispatch to the props of a component (using the Provider component)

Redux - JavaScript framework to manage frontend state of a web app
- Uses a single store to hold the state
- Actions are dispatched (sent to the store) in response to user actions or AJAX requests (the state can’t be directly modified)
-
- Actions are POJOs with a type property
- Thunk action creators - return a function instead of an object. Used to make async API requests
- Reducers = functions that get called each time an action is dispatched
    - Reducer receives an action and the current state as args, then returns an updated state

### Aaron Redux/React Review

Redux: fetch things from database, save to store, make sure any components subscribed to that info get re-updated with the new props
- Each react component has its own state and redux is how you manage all those states

- Whenever rails renders, start at application.html. then actions that are rendered go into the <%= yield> (which is the root html that we wrote)
- Application.js includes bundle plus all the other things we need (ex. Query)
- In the hook/entry file, ReactDOM.render - renders the Root store={store} tag in root
- JSX is react (writing html in a javascript file) (just like html.erb is for ruby)
    - JSX interpolation {}
    - JS interpolation `${}`
- <Provider>this is jsx so everything between these two need to be written in JSX</Provider>
- use Ajax to hit the database (which is jQuery), not rails because Rails doesn’t give us a good frontend
- Every time you need to hit Ajax, you need a thunk action creator that first makes an Ajax call, then calls one of the action creators
- Dispatch an action: first sends it through the middleware, then through the root reducer
    - middleware, reducer, and state are all managed by the store. And store has a state that’s based on these things
    - Reducer: takes in the slice of state plus the action, then sends out the new state
- Be specific because the actions are passed to every reducer
- DON’T nest states
- Should still nest routes. Routes are passed an object with “match.params” - that’s done in a selector. So can use a nested route (the url) to create a selector that grabs what we want
    - Anything that’s in a route has a “match”
- mapStatetoProps: returns an object
    - The selector in there selects the slice of state to send to the props
- State in react is for a particular component (ex. What’s passed into a form). State in redux: redux manages everything, the state knows everything and only gives components the parts of state/actions/etc that they need
- in actions, the thunk action creators: return API…. - returns JSON for our jbuilder views?
- For every table in our schema, would want one key in our state tree
- Use a selector to select for the comments for a post (for ex)
- For one of the reducer parts, use merge because you want to update {entities} which is a nested component (Obj.assign doesn’t update nested?)
- Object destructuring:
    - B = function (c:{name, age}) if it’s 2 nested keys
- Use classes when you want to take advantage of lifecycle methods
- Create a container for an component when you want to subscribe it to a store (update state), or if you want to specify a different part of state that you want them to see other than what can be passed into them (like for items and Pokemon)
    - Want containers so that a component cannot get access to more of the state than it needs (would mess it up)
    - Components (through containers) are listening for changes in state of the store, and then asks for the new props when there is a change
    - If there’s a dumb component (without a container), will not have listeners so won’t get updated with new props
- Mounting is only for instantiating (ex. Calling new PokemonIndex({props}
    - ComponentDidMount() - happens when the url matches the specific url for the component
- How to decide if save in db or in the store: if you want it it to persist after the user refreshes. Each time you refresh, the store is destroyed and needs to be remade
- PreventDefault: for if something has a default action (ex. A button doesn’t have default actions, but do need to use it if it’s a submit button that does have a default action). So pretty much only needed in a form

### How to implement search
Search:
* <input onChange={handleChange} /> hits the api
* Show a search bar with results showing up below, and enter button
* api you hit should be: get “api/search”, to: “controller_name#method_name
    * Creates a route
* Class controller_name
    * Def search
        * Playlist.where(“title LIKE ‘%?%’, params[:query])
* Render “api/whatever”
* Have a reducer to handle the search results

## React/Redux notes
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

module Happy
  module Resources

    # ResourceController implements a generic RESTful controller in the style
    # of RESTful Rails. Its #route method dispatches to the seven CRUD-like
    # methods you're used from Rails depending on HTTP verb and URL:
    #
    #     Verb   URL         Method invoked
    #     GET    /           #index
    #     GET    /new        #new
    #     POST   /           #create
    #     GET    /:id        #show
    #     GET    /:id/edit   #edit
    #     PUT    /:id        #update
    #     DELETE /:id        #destroy
    #
    # Simply derive a new controller class from this controller and implement
    # the CRUD actions listed above:
    #
    #     class MyRestFulController < Happy::Resources::ResourceController
    #       def index
    #         @users = User.all
    #         render 'index.erb'
    #       end
    #
    #       def show
    #         @user = User.find(params['id'])
    #         render 'show.erb'
    #       end
    #     end
    #
    # For RESTfully serving an ActiveModel-compliant model class, you can use
    # {Happy::Resources::ActiveModelResourceController ActiveModelResourceController}
    # that derives from ResourceController and provides a common RESTful resource pattern.
    #
    class ResourceController < Happy::Controller
      # Dispatches the request to one of seven CRUD methods.
      #
      def route
        on_get('new') { new }

        on :id do
          on_get         { show }
          on_put         { update }
          on_delete      { destroy }
          on_get('edit') { edit }
        end

        on_post { create }
        on_get  { index }
      end
    end

  end
end

module Happy
  module Resources

    class ResourceController < Happy::Controller
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

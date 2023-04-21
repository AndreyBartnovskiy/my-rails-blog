module Feedbacks
  module SendFeedback
    class CreateFeedback
      include Dry::Monads[:do, :result, :try]

      def call(request)
        params = ActionController::Parameters.new(request.params)
        model = yield deserialize(params)

        Success([model])
      end

      private

      def deserialize(params)
        res = Try[ActionController::ParameterMissing] do
          params.require(:feedback).permit(:email, :message, :name)
        end

        res.error ? Failure(deserialize) : res
      end
    end
  end
end

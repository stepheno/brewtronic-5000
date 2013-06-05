class BatchStepsController < ApplicationController
  include Wicked::Wizard
  steps :recipe, :fermenter, :dates, :measurements
end

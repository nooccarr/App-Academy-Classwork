require 'active_support'
require 'active_support/core_ext'
require 'erb'
require_relative './session'
require 'byebug'

class ControllerBase
  attr_reader :req, :res, :params

  # Setup the controller
  def initialize(req, res)
    @req = req
    @res = res
    
  end

  # Helper method to alias @already_built_response
  def already_built_response?
    @already_built_response
  end

  # Set the response status code and header
  def redirect_to(url)
    raise error if @already_built_response
    @already_built_response = true

    @res["Location"] = url
    @res.status = 302
  end

  # Populate the response with content.
  # Set the response's content type to the given type.
  # Raise an error if the developer tries to double render.
  def render_content(content, content_type)
    raise error if @already_built_response

    @res.write(content)
    @res['Content-Type'] = content_type 
    @already_built_response = true
  end

  # use ERB and binding to evaluate templates
  # pass the rendered html to render_content
  def render(template_name)
    debugger
    file_data = File.read("#{template_name}.html.erb")
    rhtml = ERB.new(file_data)
    rhtml.results(binding)

    File.open("#{template_name}.html.erb").each do |line|
    end
  end

  # method exposing a `Session` object
  def session
  end

  # use this with the router to call action_name (:index, :show, :create...)
  def invoke_action(name)
  end
end


module ApplicationHelper
  
    def login_helper style = ''
      if current_user.is_a?(GuestUser)
        link_to "Login", new_user_session_path, class: style
      else
        link_to "Logout", destroy_user_session_path, method: :delete, class: style
      end
    end
    
    def copyright_generator
      DarkstarudViewTool::Renderer.copyright "DarkStar UD", "All rights reserved"
    end
    
    def alerts
      alert = (flash[:alert] || flash[:error] || flash[:notice])
      
      if alert
        alert_generator alert
      end
    end
    
    def alert_generator msg
      js add_gritter(msg, title: "Kay Jay's Portfolio", sticky: false)
    end
    class HTMLwithPygments < Redcarpet::Render::HTML
      def block_code(code, language)
        Pygments.highlight(code, lexer: language)
      end
    end
    
    def markdown(content)
      renderer = HTMLwithPygments.new(hard_wrap: true, filter_html: true)
      options = {
        autolink: true,
        no_intra_emphasis: true,
        disable_indented_code_blocks: true,
        fenced_code_blocks: true,
        lax_html_blocks: true,
        strikethrough: true,
        superscript: true
      }
      Redcarpet::Markdown.new(renderer, options).render(content).html_safe
    end

  def gravatar_helper ref
      image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(ref.email)}",class: "img-circle", width: 60
  end
end

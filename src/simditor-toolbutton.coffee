class ToolButton extends SimpleModule

  @pluginName: 'ToolButton'

  opts:
    toolButton: false

  _init: () ->
    @editor = @_module
    return unless @opts.toolButton

    @wrapper = @editor.wrapper.find('.simditor-toolbar').find('>ul')

    ###
      {
          name: 'paste',
          title: 'button',
          tpl: '<b>BUTTON</b>',
          onClick: function(){}
      }    
    ###
    
    for btn in @opts.toolButton    
      tpl = "<li class='toolbar-button toolbar-button-#{btn.name}'><a href='javascript:;' class='toolbar-item' title='#{btn.title}'>#{btn.tpl}</a></li>"
      @el = $(tpl)
      @el.appendTo(@wrapper)

      if btn.onClick
        @el.on 'click', (e) => 
          btn.onClick.call(@, @editor, e)

Simditor.connect ToolButton
Plugin.create(:paste_from_win) do
  command(
    :paste_from_win,
    name: 'Windowsからペースト',
    condition: -> (opt) { opt.widget.editable? },
    visible: true,
    icon: Skin[:copy],
    role: :postbox
  ) do |opt|
    text = `powershell.exe Get-Clipboard -Format Text`.chop
    buffer = Plugin[:gtk].widgetof(opt.widget).widget_post.buffer
    buffer.insert_at_cursor(text)
  end
end

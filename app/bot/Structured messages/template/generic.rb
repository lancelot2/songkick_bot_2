class GenericTemplate
    def initialize
        @template = {
                    'attachment': {
                        'type': 'template',
                        'payload': {
                            'template_type': 'generic',
                            'elements': []
                        }
                    }
                }
        @elements = []
    end

    def add_element(title = '', item_url = '', image_url = '', subtitle = '', buttons = [])
        element = {}
        element['title'] = title
        element['item_url'] = item_url
        element['image_url'] = image_url
        element['subtitle'] = subtitle
        element['buttons'] = buttons
        @elements << element
    end

    def get_message
        p @template[:attachment]
        p @template[:attachment][:payload]
        @template[:attachment][:payload][:elements] = @elements
        p @template)
        return @template
    end
end

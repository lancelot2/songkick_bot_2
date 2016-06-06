# method for laying out the category carousel

def cta_categories_message(sender)
  structured_reply = {
    "attachment":{
      "type": "template",
      "payload":{
        "template_type": "generic",
        "elements":[
        {
          "title":"T-shirts",
          "image_url": "http://res.cloudinary.com/dltbqhact/image/upload/v1462733222/tshirt_category_icon_eijcqg.png",
          "buttons":[
            {
              "type":"postback",
              "payload": "t-shirts",
              "title":"View"
            }
          ]
        },
        {
          "title":"Sweatshirts",
          "image_url": "http://res.cloudinary.com/dltbqhact/image/upload/v1462733222/sweatshirt_category_icon_ywxgea.png",
          "buttons":[
            {
              "type":"postback",
              "payload": "sweatshirt",
              "title":"View"
            }

          ]
        },
        {
          "title":"Hats",
          "image_url": "http://res.cloudinary.com/dltbqhact/image/upload/v1462733223/hat_category_icon_k8fvi3.png",
          "buttons":[
            {
              "type":"postback",
              "payload": "hats",
              "title":"View"
            }

          ]
        },
        {
          "title":"Shorts",
          "image_url": "http://res.cloudinary.com/dltbqhact/image/upload/v1462733223/short_category_icon_eepngn.png",
          "buttons":[
            {
              "type":"postback",
              "payload": "shorts",
              "title":"View"
            }

          ]
        },
        {
          "title":"Shirts",
          "image_url": "http://res.cloudinary.com/dltbqhact/image/upload/v1462733223/shirt_category_icon_kydqej.png",
          "buttons":[
            {
              "type":"postback",
              "payload": "shirts",
              "title":"View"
            }

          ]
        },
        {
          "title":"Shoes",
          "image_url": "http://res.cloudinary.com/dltbqhact/image/upload/v1462820019/shoes_category_icon_2_bgjniw.png",
          "buttons":[
            {
              "type":"postback",
              "payload": "shoes",
              "title":"View"
            }
          ]
        }
      ]
      }
    }
  }

  sender.reply(structured_reply)
  transfer_middle_office(session.id, sender, structured_reply)
end

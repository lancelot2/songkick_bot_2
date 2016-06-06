# method for laying out the brand carousel

def cta_brands_message(sender)
  structured_reply = {
    "attachment":{
      "type": "template",
      "payload":{
        "template_type": "generic",
        "elements":[
        {
          "title":"Dedicated",
          "image_url":"https://d2myank7uw5lwy.cloudfront.net/client/tshirtstore/dynamic/articles/dedicated_5599.jpg",
          "buttons":[
            {
              "type":"postback",
              "payload": "dedicated",
              "title":"View"
            }
          ]
        },
        {
          "title":"Atinum",
          "image_url":"https://d2myank7uw5lwy.cloudfront.net/client/tshirtstore/dynamic/articles/atinum_logosmall_6748.jpg",

          "buttons":[
            {
              "type":"postback",
              "payload": "atinum",
              "title":"View"
            }

          ]
        },
        {
          "title":"Jolly Awesome",
          "image_url":"http://res.cloudinary.com/dltbqhact/image/upload/c_pad,h_300,w_573/v1462880099/jolly_awesome_logo_9906_ildqva.jpg",

          "buttons":[
            {
              "type":"postback",
              "payload": "jollyawesome",
              "title":"View"
            }

          ]
        },
        {
          "title":"Star Wars",
          "image_url":"http://img.lum.dolimg.com/v1/images/starwars_551c43f4.jpeg",

          "buttons":[
            {
              "type":"postback",
              "payload": "starwars",
              "title":"View"
            }

          ]
        },
        {
          "title":"Bike Lover",
          "image_url":"http://res.cloudinary.com/dltbqhact/image/upload/c_pad,h_134,w_256/v1462880300/footer-logo_lhbf8s.png",
          "buttons":[
            {
              "type":"postback",
              "payload": "bikelover",
              "title":"View"
            }
          ]
        },
        {
          "title":"Adidas",
          "image_url":"http://res.cloudinary.com/dltbqhact/image/upload/c_pad,h_800,w_1528/v1462879533/6ukiRi6_wx5fu8.png",
          "buttons":[
            {
              "type":"postback",
              "payload": "adidas",
              "title":"View"
            }
          ]
        }
       ]
      }
    }
  }
  sender.reply(structured_reply)
  transfer_middle_office(session.id, username, sender, structured_reply)
end



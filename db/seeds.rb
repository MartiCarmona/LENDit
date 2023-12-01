require 'open-uri'

Product.destroy_all
User.destroy_all
Category.destroy_all

User.create(email: 'ignacio@gmail.com', first_name: 'Ignacio', last_name: 'Borrell', password: '123456')
User.create(email: 'nahuel@gmail.com', first_name: 'Nahuel', last_name: 'Ribera', password: '123456')
User.create(email: 'marti@gmail.com', first_name: 'Marti', last_name: 'Carmona', password: '123456')

fashion_category = Category.find_or_create_by(name: 'Fashion')
cameras_category = Category.find_or_create_by(name: 'Cameras')
sports_category = Category.find_or_create_by(name: 'Sports')
audio_category = Category.find_or_create_by(name: 'Audio')
consoles_category = Category.find_or_create_by(name: 'Consoles')
furniture_category = Category.find_or_create_by(name: 'Furniture')


products = [
  {
    title: 'Jacquemus Handbag',
    description: 'Jacquemus Le Chiquito, bought in Paris.',
    price_per_day: 29.90,
    condition: 'As new',
    category: fashion_category,
    image_url: 'https://media.karousell.com/media/photos/products/2022/6/3/_jacquemus_le_chiquito_moyen_i_1654252564_c99c802c_progressive.jpg'
  },

  {
    title: 'Louis Vuitton Bag',
    description: 'Original LV Neverfull bag, used a few times.',
    price_per_day: 34.90,
    condition: 'As new',
    category: fashion_category,
    image_url: 'https://di2ponv0v5otw.cloudfront.net/posts/2022/09/29/6335c6a91741be83d1cc7e46/m_634472728634cba59b17aefb.jpg'
  },

  {
    title: 'Goyard Bag',
    description: 'I love haute couture! Goyard Messenger bag available.',
    price_per_day: 45,
    condition: 'As new',
    category: fashion_category,
    image_url: 'https://media.karousell.com/media/photos/products/2019/10/02/authentic_preloved_goyard_belvedere_pm_messenger_bag_1569992309_dd0e66bc.jpg'
  },

  {
    title: 'Gucci Handbag',
    description: 'Bought in Barcelona. Message me for more pictures.',
    price_per_day: 30,
    condition: 'Good state',
    category: fashion_category,
    image_url: 'https://media.karousell.com/media/photos/products/2020/12/23/gucci_211137_brown_gg_handbag__1608692533_8a4baf30_progressive.jpg'
  },

  {
    title: 'Prada bag',
    description: 'Designer handbag, Prada Saffiano Galleria',
    price_per_day: 42.50,
    condition: 'As new',
    category: fashion_category,
    image_url: 'https://www.herauthentic.com/wp-content/uploads/2022/10/IMG_3574.jpg'
  },

  {
    title: 'YSL Bag',
    description: 'Yves Saint Laurent sunset bag, six months of use.',
    price_per_day: 35,
    condition: 'As new',
    category: fashion_category,
    image_url: 'https://media-photos.depop.com/b0/2166277/1007502475_a2726218052e4bdfababbc74ecb5a7b9/P0.jpg'
  },

  {
    title: 'Valentino Bag',
    description: 'Supervee model, trendy right now!',
    price_per_day: 38.50,
    condition: 'As new',
    category: fashion_category,
    image_url: 'https://i.pinimg.com/564x/2f/9d/c8/2f9dc853a5ce75cc043ec5b2c7f53c24.jpg'
  },

  {
    title: 'Balenciaga Handbag',
    description: 'Mini Balenciaga Hourglass handbag, color gray.',
    price_per_day: 29,
    condition: 'As new',
    category: fashion_category,
    image_url: 'https://media-photos.depop.com/b1/22142722/1618747820_29353250a71549d18c0346df8559eb05/P0.jpg'
  },

  {
    title: 'Diesel Handbag',
    description: 'Women’s diesel 1DR shoulder bag. Outfit ready!',
    price_per_day: 20,
    condition: 'As new',
    category: fashion_category,
    image_url: 'https://media-photos.depop.com/b1/36066085/1644008480_7902d4568383430390b08ec46a192134/P8.jpg'
  },

  {
    title: 'Channel Handbag',
    description: 'Chanel classic small matte black Caviar Chevron',
    price_per_day: 54,
    condition: 'As new',
    category: fashion_category,
    image_url: 'https://media-photos.depop.com/b0/35123124/1230549941_9030ca7d9d3b4f8f9b52738cfd794509/P0.jpg'
  },

  {
    title: 'Mondraker E-bike',
    description: 'Powerful and lightweight electric bike made with carbon fiber and steel.',
    price_per_day: 90,
    condition: 'Good state',
    category: sports_category,
    image_url: 'https://keyassets.timeincuk.net/inspirewp/live/wp-content/uploads/sites/11/2023/06/Untitled-design-2023-06-20T112801.233.jpg'
  },
  {
    title: 'Electric Foil Board',
    description: 'Surf waves with this amazing board',
    price_per_day: 240,
    condition: 'Good state',
    category: sports_category,
    image_url: 'https://i0.wp.com/santivachronicle.com/wp-content/uploads/2020/01/ces-E-Surf-Board-Photo.jpg?ssl=1'
  },
  {
    title: 'Cube E-Bike',
    description: 'Excellent autonomy, really fast bike.',
    price_per_day: 130,
    condition: 'Like New',
    category: sports_category,
    image_url: 'https://images.squarespace-cdn.com/content/v1/604f439d17497771afc128be/81ee7cac-dbeb-44ab-891e-a4e6eb4ac301/AI5I9835.JPG'
  },
  {
    title: 'Flyboard',
    description: 'Powerful water jet board, learn to fly!',
    price_per_day: 180,
    condition: 'Good state',
    category: sports_category,
    image_url: 'https://everent.es/wp-content/uploads/2022/07/fly-boarding.jpg'
  },
  {
    title: 'Seabob',
    description: 'Underwater electric scooter, go scuba diving like a pro',
    price_per_day: 95.50,
    condition: 'Good state',
    category: sports_category,
    image_url: 'https://takeoffluxurytoys.es/blog/wp-content/uploads/2018/07/seabob-erlebnis-dive_m.jpg'
  },
  {
    title: 'Hunting bow',
    description: 'Upgrade your hunting experience with the latest compost bow of the market.',
    price_per_day: 40,
    condition: 'Acceptable',
    category: sports_category,
    image_url: 'https://bowhuntersunited.com/wp-content/uploads/2018/06/00-Hero-Bowhunting-Checklist-101-Photo-Credit-ATA.jpg'
  },
  {
    title: 'Electric dirtbike',
    description: 'Bought three months ago, I love it but I live in a big city.',
    price_per_day: 125,
    condition: 'As new',
    category: sports_category,
    image_url: 'https://cdn.motor1.com/images/mgl/nxzro/s1/4x3/meet-the-sur-ron-light-bee-long-range-e-bike.webp'
  },
  {
    title: 'Porsche E-bike',
    description: 'Stunning electric bike with great autonomy, speed and design.',
    price_per_day: 260,
    condition: 'As new',
    category: sports_category,
    image_url: 'https://images.ctfassets.net/1oyzmkwpf3d5/4XcmGDZf7rohAHwpjPd89d/d4fe63af6027ed5e007dea9c1a637234/eBike_Kopie_1.jpg'
  },
  {
    title: 'Smaco scuba gear',
    description: 'Complete SMACO S400pro equipment, high pressure compressor included, like new.',
    price_per_day: 35,
    condition: 'As new',
    category: sports_category,
    image_url: 'https://cdn.wallapop.com/images/10420/fo/63/__/c10420p947587769/i3551779136.jpg?pictureSize=W640'
  },
  {
    title: 'Hunting Crossbow',
    description: 'Powerful and precise, this hunting crossbow delivers the perfect combination of speed and accuracy.',
    price_per_day: 110,
    condition: 'As new',
    category: sports_category,
    image_url: 'https://content.osgnetworks.tv/gameandfishing/content/photos/gaf-NewCrossbowsLead-ExcaliburMicro380-1200x800.jpg'
  },
  {
    title: 'PS5',
    description: 'Immerse yourself in the next-gen gaming experience. Breathtaking graphics and fastest load times.',
    price_per_day: 24.99,
    condition: 'As new',
    category: consoles_category,
    image_url: 'https://www.trustedreviews.com/wp-content/uploads/sites/54/2022/11/PS5-Review-8-1024x768.jpg'
  },
  {
    title: 'Meta Quest 3',
    description: 'Step into a new dimension of gaming freedom with the Meta Quest 3 VR headset.',
    price_per_day: 20,
    condition: 'As new',
    category: consoles_category,
    image_url: 'https://i.ds.at/p9hPYA/c:1600:956:fp:0.500:0.500/rs:fill:750:0/plain/lido-images/2023/10/20/9b06a5ad-4bc0-463c-bfb5-2a43883b30fe.jpeg'
  },
  {
    title: 'Xbox Series X',
    description: 'Experience true gaming with the Xbox Series X. 4K visuals and high-speed performance.',
    price_per_day: 27.90,
    condition: 'Like New',
    category: consoles_category,
    image_url: 'https://media-mbst-pub-ue1.s3.amazonaws.com/creatr-uploaded-images/2020-11/00ab1e71-1f19-11eb-9b53-ff3bab8dbe8c'
  },
  {
    title: 'Nintendo Switch',
    description: 'Versatility and endless gaming fun with the Nintendo Switch. Switch between handheld and TV modes.',
    price_per_day: 14.90,
    condition: 'As new',
    category: consoles_category,
    image_url: 'https://i.ebayimg.com/images/g/6awAAOSwwophcEos/s-l1200.jpg'
  },
  {
    title: 'HTC Vive 2',
    description: 'Experience the future of virtual reality with the HTC Vive 2.',
    price_per_day: 22,
    condition: 'As new',
    category: consoles_category,
    image_url: 'https://i.gzn.jp/img/2021/08/08/vive-pro-2/00.jpg'
  },
  {
    title: 'PS5',
    description: 'Experience gaming like never before with the cutting-edge PS5.',
    price_per_day: 28.50,
    condition: 'As new',
    category: consoles_category,
    image_url: 'https://impulsogeek.com/wp-content/uploads/2021/02/feat-4.jpg'
  },
  {
    title: 'Logitech G29',
    description: 'Feel the thrill of the race with the Logitech G29 racing wheel. Realistic force feedback!',
    price_per_day: 20,
    condition: 'As new',
    category: consoles_category,
    image_url: 'https://miro.medium.com/v2/resize:fit:8064/1*msuNXOOIznKiOGuBY0zpcw.jpeg'
  },
  {
    title: 'Canon EOS R7',
    description: 'Unleash your creativity with the Canon EOS R7 mirrorless camera.',
    price_per_day: 44.90,
    condition: 'As new',
    category: cameras_category,
    image_url: 'https://www.camara.net/images/com_hikashop/upload/CANON-EOS-R7-Boitier-nu_Hybride8.jpg'
  },
  {
    title: 'Drone DJI Mini 3',
    description: 'Capture stunning aerial footage with this advanced drone.',
    price_per_day: 34.99,
    condition: 'As new',
    category: cameras_category,
    image_url: 'https://cdn.wallapop.com/images/10420/fk/hq/__/c10420p941412245/i3514636100.jpg?pictureSize=W640'
  },
  {
    title: 'GoPro Hero 10',
    description: 'Shoot high-quality videos and photos with crystal-clear detail.',
    price_per_day: 18.99,
    condition: 'Good state',
    category: cameras_category,
    image_url: 'https://i.blogs.es/b44142/gopro-hero-10-black-2-/450_1000.jpg'
  },
  {
    title: 'Canon xA60 4K',
    description: "Capture life's moments in cinematic detail with the Canon XA60 4K camcorder.",
    price_per_day: 50,
    condition: 'As new',
    category: cameras_category,
    image_url: 'https://i.ytimg.com/vi/TFhN6Bc-85g/maxresdefault.jpg'
  },
  {
    title: 'Mavic 3 Drone',
    description: 'Unleash the skies with the Mavic 3 drone. Have fun capturing breathtaking aerial perspectives.',
    price_per_day: 40,
    condition: 'As new',
    category: cameras_category,
    image_url: 'https://cdn.wallapop.com/images/10420/ez/4h/__/c10420p905522774/i3307121797.jpg?pictureSize=W320'
  },
  {
    title: 'Insta 360',
    description: 'Reimagine your storytelling with Insta360. This compact camera captures every angle in stunning 360.',
    price_per_day: 20,
    condition: 'Good state',
    category: cameras_category,
    image_url: 'https://cdn.wallapop.com/images/10420/fa/v2/__/c10420p925238078/i3425159627.jpg?pictureSize=W640'
  },
  {
    title: 'Nikon D7500',
    description: 'Take amazing shots with this Nikon D7500 reflex camera.',
    price_per_day: 45,
    condition: 'As new',
    category: cameras_category,
    image_url: 'https://cdn.wallapop.com/images/10420/ek/k0/__/c10420p881051936/i3177936267.jpg?pictureSize=W640'
  },
  {
    title: 'GoPro Hero 11',
    description: 'Shoot high-quality action videos and photos with crystal-clear detail.',
    price_per_day: 23.50,
    condition: 'As new',
    category: cameras_category,
    image_url: 'https://cdn.wallapop.com/images/10420/fc/fl/__/c10420p927875759/i3437854604.jpg?pictureSize=W640'
  },
  {
    title: 'DJI Gimbal',
    description: 'Stabilize your shots with this amazing DJI OM4 gimbal. Works for phones and cameras.',
    price_per_day: 12,
    condition: 'As new',
    category: cameras_category,
    image_url: 'https://micamaradeportiva.com/wp-content/uploads/2020/08/unboxing_accesorios_gimbal_OM4.jpg'
  },
  {
    title: 'Nikon Wide Lens',
    description: 'Change the presence of your shots, try this wide-angle lens.',
    price_per_day: 30,
    condition: 'As new',
    category: cameras_category,
    image_url: 'https://m.media-amazon.com/images/I/91Hb3sC5zWL._AC_UF894,1000_QL80_.jpg'
  },
  {
    title: 'AirPods Max',
    description: 'Dive into the ultimate audio experience with AirPods Max, noise cancelling is mad.',
    price_per_day: 29.90,
    condition: 'As new',
    category: audio_category,
    image_url: 'https://i.ytimg.com/vi/TFhN6Bc-85g/maxresdefault.jpg'
  },
  {
    title: 'Homestudio Speakers',
    description: 'Upgrade your homestudio with these KRK RP5 speakers.',
    price_per_day: 20,
    condition: 'As new',
    category: audio_category,
    image_url: 'https://cdn.wallapop.com/images/10420/fm/3r/__/c10420p944120346/i3530396227.jpg?pictureSize=W640'
  },
  {
    title: 'Rode NT1-A',
    description: 'Start your singer career with this great microphone.',
    price_per_day: 15,
    condition: 'New',
    category: audio_category,
    image_url: 'https://cdn.wallapop.com/images/10420/fq/t4/__/c10420p952021180/i3580716655.jpg?pictureSize=W640'
  },
  {
    title: 'Plastic chairs',
    description: 'Perfect for events! Message me and tell me how many chairs you need.',
    price_per_day: 0.90,
    condition: 'Good state',
    category: furniture_category,
    image_url: 'https://www.alquilerdesillasbogota.com/wp-content/uploads/2018/04/12017_575261199172981_1626107538_n.jpg'
  },
  {
    title: 'Wooden chairs',
    description: 'Are you organising an event? Message me and tell me how many chairs you need.',
    price_per_day: 1.40,
    condition: 'Good state',
    category: furniture_category,
    image_url: 'https://cdn.wallapop.com/images/10420/ey/zo/__/c10420p905298621/i3305890913.jpg?pictureSize=W320'
  },
  {
    title: 'Barbecue Grill',
    description: 'Everyone loves a good BBQ! Perfect for garden parties',
    price_per_day: 40,
    condition: 'Good state',
    category: furniture_category,
    image_url: 'https://www.conchidecoracion.com/galeria/articulos/82221-001_47190_3.jpeg'
  },
  {
    title: 'Office chairs',
    description: 'Need chairs for your event? Message me and tell me how many chairs you need.',
    price_per_day: 2,
    condition: 'Good state',
    category: furniture_category,
    image_url: 'https://cdn.wallapop.com/images/10420/fs/cc/__/c10420p954597912/i3595967799.jpg?pictureSize=W320'
  },
  {
    title: 'Plastic chairs',
    description: 'Need chairs for your bar or event? Message me and tell me how many chairs you need.',
    price_per_day: 1.20,
    condition: 'Good state',
    category: furniture_category,
    image_url: 'https://cdn.wallapop.com/images/10420/fu/li/__/c10420p958385488/i4614710174.jpg?pictureSize=W640'
  },
  {
    title: 'Small gas BBQ',
    description: 'Want to do a BBQ? Perfect for 1 to 6 persons.',
    price_per_day: 25,
    condition: 'Good state',
    category: furniture_category,
    image_url: 'https://www.paladareventos.com/imagenesdb/cabecera/montaje-patio-butacas-sillas-diseno-dune-web.jpg'
  },
  {
    title: 'Tent 3x3',
    description: 'Need some tents for business? Message me and tell me how many tents you need.',
    price_per_day: 3,
    condition: 'Good state',
    category: furniture_category,
    image_url: 'https://cdn.wallapop.com/images/10420/fu/li/__/c10420p958385488/i4614710174.jpg?pictureSize=W640'
  },
  {
    title: 'Plastic tables',
    description: 'Need some tables for event? Message me and tell me how many.',
    price_per_day: 2,
    condition: 'Good state',
    category: furniture_category,
    image_url: 'https://i.pinimg.com/originals/d7/ca/3e/d7ca3e70d551c0841a1e3404301126c8.jpg'
  }
]

products.each do |product|
  begin
    file = URI.open(product[:image_url])

    new_product = Product.new(
      title: product[:title],
      description: product[:description],
      price_per_day: product[:price_per_day],
      condition: product[:condition],
      category: product[:category],
      user: User.last
    )

    new_product.image.attach(io: file, filename: "#{product[:title].parameterize.underscore}.jpg", content_type: 'image/jpg')
    new_product.save!
  rescue StandardError => e
    puts "Error creating product '#{product[:title]}': #{e.message}"
  end
end

Booking.create(start_date: Date.today, end_date: Date.today + 1, status: 'accepted', user: User.first, product: Product.first)

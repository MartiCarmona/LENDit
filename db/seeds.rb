require 'open-uri'

Product.destroy_all
User.destroy_all

User.create(email: 'ignacio@gmail.com', first_name: 'Ignacio', last_name: 'Borrell', password: '123456')
User.create(email: 'nahuel@gmail.com', first_name: 'Nahuel', last_name: 'Ribera', password: '123456')
User.create(email: 'marti@gmail.com', first_name: 'Marti', last_name: 'Carmona', password: '123456')

gadgets_category = Category.find_or_create_by(name: 'Gadgets')
cameras_category = Category.find_or_create_by(name: 'Cameras')
outdoor_category = Category.find_or_create_by(name: 'Outdoor')
audio_category = Category.find_or_create_by(name: 'Audio')
consoles_category = Category.find_or_create_by(name: 'Consoles')

products = [
  {
    title: 'Smartwatch X',
    description: 'Stay connected with the latest smartwatch on the market.',
    price_per_day: 12.99,
    condition: 'New',
    category: gadgets_category,
    image_url: 'https://m.media-amazon.com/images/I/51rkP9-meSL.jpg'
  },
  {
    title: 'Ultra-Slim Laptop',
    description: 'Powerful and lightweight laptop for productivity on the go.',
    price_per_day: 24.99,
    condition: 'Like New',
    category: gadgets_category,
    image_url: 'https://www.trustedreviews.com/wp-content/uploads/sites/54/2022/11/PS5-Review-8-1024x768.jpg'
  },
  {
    title: 'VR Glasses',
    description: 'Experience the future with these cutting-edge AR glasses.',
    price_per_day: 49.99,
    condition: 'Excellent',
    category: gadgets_category,
    image_url: 'https://www.apple.com/v/apple-vision-pro/b/images/overview/visionos/drawer/voice_startframe__c0a4vcs48m0y_large.jpg'
  },
  {
    title: 'Drone DJI Mini 3',
    description: 'Capture stunning aerial footage with this advanced drone.',
    price_per_day: 39.99,
    condition: 'Good',
    category: gadgets_category,
    image_url: 'https://m.media-amazon.com/images/I/51sV-rg4KqL._AC_UF894,1000_QL80_.jpg'
  },
  {
    title: 'GoPro Hero 10',
    description: 'Shoot high-quality videos and photos with crystal-clear detail.',
    price_per_day: 18.99,
    condition: 'Excellent',
    category: cameras_category,
    image_url: 'https://i.blogs.es/b44142/gopro-hero-10-black-2-/450_1000.jpg'
  },
  {
    title: 'Canon xA60 4K',
    description: 'Charge your devices effortlessly with this wireless charging pad.',
    price_per_day: 9.99,
    condition: 'New',
    category: cameras_category,
    image_url: 'https://thumb.pccomponentes.com/w-530-530/articles/1064/10649216/135-canon-xa60-videocamara-profesional-ultrahd-4k-20x.jpg'
  },
  {
    title: 'Smartwatch X',
    description: 'Stay connected with the latest smartwatch on the market.',
    price_per_day: 12.99,
    condition: 'New',
    category: gadgets_category,
    image_url: 'https://m.media-amazon.com/images/I/51rkP9-meSL.jpg'
  },
  {
    title: 'Ultra-Slim Laptop',
    description: 'Powerful and lightweight laptop for productivity on the go.',
    price_per_day: 24.99,
    condition: 'Like New',
    category: gadgets_category,
    image_url: 'https://www.trustedreviews.com/wp-content/uploads/sites/54/2022/11/PS5-Review-8-1024x768.jpg'
  },
  {
    title: 'VR Glasses',
    description: 'Experience the future with these cutting-edge AR glasses.',
    price_per_day: 49.99,
    condition: 'Excellent',
    category: gadgets_category,
    image_url: 'https://www.apple.com/v/apple-vision-pro/b/images/overview/visionos/drawer/voice_startframe__c0a4vcs48m0y_large.jpg'
  },
  {
    title: 'Drone DJI Mini 3',
    description: 'Capture stunning aerial footage with this advanced drone.',
    price_per_day: 39.99,
    condition: 'Good',
    category: gadgets_category,
    image_url: 'https://m.media-amazon.com/images/I/51sV-rg4KqL._AC_UF894,1000_QL80_.jpg'
  },
  {
    title: 'GoPro Hero 10',
    description: 'Shoot high-quality videos and photos with crystal-clear detail.',
    price_per_day: 18.99,
    condition: 'Excellent',
    category: cameras_category,
    image_url: 'https://i.blogs.es/b44142/gopro-hero-10-black-2-/450_1000.jpg'
  },
  {
    title: 'Canon xA60 4K',
    description: 'Charge your devices effortlessly with this wireless charging pad.',
    price_per_day: 9.99,
    condition: 'New',
    category: cameras_category,
    image_url: 'https://thumb.pccomponentes.com/w-530-530/articles/1064/10649216/135-canon-xa60-videocamara-profesional-ultrahd-4k-20x.jpg'
  },
  {
    title: 'Smartwatch X',
    description: 'Stay connected with the latest smartwatch on the market.',
    price_per_day: 12.99,
    condition: 'New',
    category: gadgets_category,
    image_url: 'https://m.media-amazon.com/images/I/51rkP9-meSL.jpg'
  },
  {
    title: 'Ultra-Slim Laptop',
    description: 'Powerful and lightweight laptop for productivity on the go.',
    price_per_day: 24.99,
    condition: 'Like New',
    category: outdoor_category,
    image_url: 'https://www.trustedreviews.com/wp-content/uploads/sites/54/2022/11/PS5-Review-8-1024x768.jpg'
  },
  {
    title: 'VR Glasses',
    description: 'Experience the future with these cutting-edge AR glasses.',
    price_per_day: 49.99,
    condition: 'Excellent',
    category: cameras_category,
    image_url: 'https://www.apple.com/v/apple-vision-pro/b/images/overview/visionos/drawer/voice_startframe__c0a4vcs48m0y_large.jpg'
  },
  {
    title: 'Drone DJI Mini 3',
    description: 'Capture stunning aerial footage with this advanced drone.',
    price_per_day: 39.99,
    condition: 'Good',
    category: cameras_category,
    image_url: 'https://m.media-amazon.com/images/I/51sV-rg4KqL._AC_UF894,1000_QL80_.jpg'
  },
  {
    title: 'GoPro Hero 10',
    description: 'Shoot high-quality videos and photos with crystal-clear detail.',
    price_per_day: 18.99,
    condition: 'Excellent',
    category: cameras_category,
    image_url: 'https://i.blogs.es/b44142/gopro-hero-10-black-2-/450_1000.jpg'
  },
  {
    title: 'Canon xA60 4K',
    description: 'Charge your devices effortlessly with this wireless charging pad.',
    price_per_day: 9.99,
    condition: 'New',
    category: cameras_category,
    image_url: 'https://thumb.pccomponentes.com/w-530-530/articles/1064/10649216/135-canon-xa60-videocamara-profesional-ultrahd-4k-20x.jpg'
  },
  {
    title: 'Smartwatch X',
    description: 'Stay connected with the latest smartwatch on the market.',
    price_per_day: 12.99,
    condition: 'New',
    category: gadgets_category,
    image_url: 'https://m.media-amazon.com/images/I/51rkP9-meSL.jpg'
  },
  {
    title: 'Ultra-Slim Laptop',
    description: 'Powerful and lightweight laptop for productivity on the go.',
    price_per_day: 24.99,
    condition: 'Like New',
    category: consoles_category,
    image_url: 'https://www.trustedreviews.com/wp-content/uploads/sites/54/2022/11/PS5-Review-8-1024x768.jpg'
  },
  {
    title: 'VR Glasses',
    description: 'Experience the future with these cutting-edge AR glasses.',
    price_per_day: 49.99,
    condition: 'Excellent',
    category: consoles_category,
    image_url: 'https://www.apple.com/v/apple-vision-pro/b/images/overview/visionos/drawer/voice_startframe__c0a4vcs48m0y_large.jpg'
  },
  {
    title: 'Drone DJI Mini 3',
    description: 'Capture stunning aerial footage with this advanced drone.',
    price_per_day: 39.99,
    condition: 'Good',
    category: consoles_category,
    image_url: 'https://m.media-amazon.com/images/I/51sV-rg4KqL._AC_UF894,1000_QL80_.jpg'
  },
  {
    title: 'GoPro Hero 10',
    description: 'Shoot high-quality videos and photos with crystal-clear detail.',
    price_per_day: 18.99,
    condition: 'Excellent',
    category: cameras_category,
    image_url: 'https://i.blogs.es/b44142/gopro-hero-10-black-2-/450_1000.jpg'
  },
  {
    title: 'Canon xA60 4K',
    description: 'Charge your devices effortlessly with this wireless charging pad.',
    price_per_day: 9.99,
    condition: 'New',
    category: cameras_category,
    image_url: 'https://thumb.pccomponentes.com/w-530-530/articles/1064/10649216/135-canon-xa60-videocamara-profesional-ultrahd-4k-20x.jpg'
  },
  {
    title: 'Smartwatch X',
    description: 'Stay connected with the latest smartwatch on the market.',
    price_per_day: 12.99,
    condition: 'New',
    category: consoles_category,
    image_url: 'https://m.media-amazon.com/images/I/51rkP9-meSL.jpg'
  },
  {
    title: 'Ultra-Slim Laptop',
    description: 'Powerful and lightweight laptop for productivity on the go.',
    price_per_day: 24.99,
    condition: 'Like New',
    category: gadgets_category,
    image_url: 'https://www.trustedreviews.com/wp-content/uploads/sites/54/2022/11/PS5-Review-8-1024x768.jpg'
  },
  {
    title: 'VR Glasses',
    description: 'Experience the future with these cutting-edge AR glasses.',
    price_per_day: 49.99,
    condition: 'Excellent',
    category: cameras_category,
    image_url: 'https://www.apple.com/v/apple-vision-pro/b/images/overview/visionos/drawer/voice_startframe__c0a4vcs48m0y_large.jpg'
  },
  {
    title: 'Drone DJI Mini 3',
    description: 'Capture stunning aerial footage with this advanced drone.',
    price_per_day: 39.99,
    condition: 'Good',
    category: audio_category,
    image_url: 'https://m.media-amazon.com/images/I/51sV-rg4KqL._AC_UF894,1000_QL80_.jpg'
  },
  {
    title: 'GoPro Hero 10',
    description: 'Shoot high-quality videos and photos with crystal-clear detail.',
    price_per_day: 18.99,
    condition: 'Excellent',
    category: cameras_category,
    image_url: 'https://i.blogs.es/b44142/gopro-hero-10-black-2-/450_1000.jpg'
  },
  {
    title: 'Canon xA60 4K',
    description: 'Charge your devices effortlessly with this wireless charging pad.',
    price_per_day: 9.99,
    condition: 'New',
    category: cameras_category,
    image_url: 'https://thumb.pccomponentes.com/w-530-530/articles/1064/10649216/135-canon-xa60-videocamara-profesional-ultrahd-4k-20x.jpg'
  },
  {
    title: 'Smartwatch X',
    description: 'Stay connected with the latest smartwatch on the market.',
    price_per_day: 12.99,
    condition: 'New',
    category: audio_category,
    image_url: 'https://m.media-amazon.com/images/I/51rkP9-meSL.jpg'
  },
  {
    title: 'Ultra-Slim Laptop',
    description: 'Powerful and lightweight laptop for productivity on the go.',
    price_per_day: 24.99,
    condition: 'Like New',
    category: audio_category,
    image_url: 'https://www.trustedreviews.com/wp-content/uploads/sites/54/2022/11/PS5-Review-8-1024x768.jpg'
  },
  {
    title: 'VR Glasses',
    description: 'Experience the future with these cutting-edge AR glasses.',
    price_per_day: 49.99,
    condition: 'Excellent',
    category: audio_category,
    image_url: 'https://www.apple.com/v/apple-vision-pro/b/images/overview/visionos/drawer/voice_startframe__c0a4vcs48m0y_large.jpg'
  },
  {
    title: 'Drone DJI Mini 3',
    description: 'Capture stunning aerial footage with this advanced drone.',
    price_per_day: 39.99,
    condition: 'Good',
    category: audio_category,
    image_url: 'https://m.media-amazon.com/images/I/51sV-rg4KqL._AC_UF894,1000_QL80_.jpg'
  },
  {
    title: 'GoPro Hero 10',
    description: 'Shoot high-quality videos and photos with crystal-clear detail.',
    price_per_day: 18.99,
    condition: 'Excellent',
    category: cameras_category,
    image_url: 'https://i.blogs.es/b44142/gopro-hero-10-black-2-/450_1000.jpg'
  },
  {
    title: 'Canon xA60 4K',
    description: 'Charge your devices effortlessly with this wireless charging pad.',
    price_per_day: 9.99,
    condition: 'New',
    category: cameras_category,
    image_url: 'https://thumb.pccomponentes.com/w-530-530/articles/1064/10649216/135-canon-xa60-videocamara-profesional-ultrahd-4k-20x.jpg'
  },
  {
    title: 'Smartwatch X',
    description: 'Stay connected with the latest smartwatch on the market.',
    price_per_day: 12.99,
    condition: 'New',
    category: consoles_category,
    image_url: 'https://m.media-amazon.com/images/I/51rkP9-meSL.jpg'
  },
  {
    title: 'Ultra-Slim Laptop',
    description: 'Powerful and lightweight laptop for productivity on the go.',
    price_per_day: 24.99,
    condition: 'Like New',
    category: consoles_category,
    image_url: 'https://www.trustedreviews.com/wp-content/uploads/sites/54/2022/11/PS5-Review-8-1024x768.jpg'
  },
  {
    title: 'VR Glasses',
    description: 'Experience the future with these cutting-edge AR glasses.',
    price_per_day: 49.99,
    condition: 'Excellent',
    category: consoles_category,
    image_url: 'https://www.apple.com/v/apple-vision-pro/b/images/overview/visionos/drawer/voice_startframe__c0a4vcs48m0y_large.jpg'
  },
  {
    title: 'Drone DJI Mini 3',
    description: 'Capture stunning aerial footage with this advanced drone.',
    price_per_day: 39.99,
    condition: 'Good',
    category: consoles_category,
    image_url: 'https://m.media-amazon.com/images/I/51sV-rg4KqL._AC_UF894,1000_QL80_.jpg'
  },
  {
    title: 'GoPro Hero 10',
    description: 'Shoot high-quality videos and photos with crystal-clear detail.',
    price_per_day: 18.99,
    condition: 'Excellent',
    category: cameras_category,
    image_url: 'https://i.blogs.es/b44142/gopro-hero-10-black-2-/450_1000.jpg'
  },
  {
    title: 'Canon xA60 4K',
    description: 'Charge your devices effortlessly with this wireless charging pad.',
    price_per_day: 9.99,
    condition: 'New',
    category: cameras_category,
    image_url: 'https://thumb.pccomponentes.com/w-530-530/articles/1064/10649216/135-canon-xa60-videocamara-profesional-ultrahd-4k-20x.jpg'
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

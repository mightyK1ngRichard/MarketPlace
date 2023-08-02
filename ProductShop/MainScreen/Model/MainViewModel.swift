//
//  MainViewModel.swift
//  ProductShop
//
//  Created by Дмитрий Пермяков on 02.08.2023.
//

import Foundation

struct MainViewModel {
    let type: SectionType
    let items: [Item]
    
    enum SectionType {
        case adverticing
        case products
        case dishes
        case goods
    }
}

struct Item {
    let titel       : String?
    let image       : URL?
    let description : String?
}

// MARK: - Типо данные из бд для вёрстки.

let adverticings: MainViewModel = .init(type: MainViewModel.SectionType.adverticing, items: [
    .init(titel: nil, image: URL(string: "https://sun9-43.userapi.com/impg/w3aXjQYkCz555ON7GxBKSzA2A0S91rRLT_7UKA/Pyvdfo-CkJA.jpg?size=1064x500&quality=95&sign=245c56fb7bd1063be0475734c5a91842&c_uniq_tag=Luxnl2C1lY4sKUDP8xXhdVIS5Wx9YCWubQqhJA6Lxxo&type=album"), description: nil),
    .init(titel: nil, image: URL(string: "https://media.thenerdstash.com/wp-content/uploads/2023/06/Miles-Morales-1.jpg.webp"), description: nil),
    .init(titel: nil, image: URL(string: "https://forum.rudtp.ru/attachments/98777-jpg.114856/"), description: nil),
    .init(titel: nil, image: URL(string: "https://sun9-21.userapi.com/impf/H0wiYkIMaAY9H9_c8__Um30l36GzJoQFgf6zvg/eICdHSnEw4U.jpg?size=910x468&quality=96&sign=075437fc55f55e2e6ed44bdde1a7afc8&c_uniq_tag=ME_f1o9rKfz5DN6duJgelKPiVPqc7vR4ND_SAI56JdE&type=album"), description: nil),
    .init(titel: nil, image: URL(string: "https://sun9-80.userapi.com/impf/c621616/v621616795/2b81b/W29aXc67kl0.jpg?size=1280x667&quality=96&sign=9ca432063ddb8fcaccd7f3ca66948e67&c_uniq_tag=9xC7QqzgDiMsE-YdjmKecAyDUCnhAhQGiNLLDdFM5tI&type=album"), description: nil),
])

let products: MainViewModel = .init(type: .products, items: [
    .init(titel: "Телефоны", image: URL(string: "https://img.freepik.com/free-vector/phone-with-gradient-wallpaper_23-2147850273.jpg?w=1380&t=st=1690933742~exp=1690934342~hmac=21b1436a653fc60d67be1088562c19f20fc61868e50047285f5232d27ab74f6f"), description: nil),
    .init(titel: "Телевизоры", image: URL(string: "https://img.freepik.com/premium-vector/vector-smart-tv-screen-mock-up_47649-465.jpg?w=1380"), description: nil),
    .init(titel: "Кофе", image: URL(string: "https://img.freepik.com/free-vector/coffee-cup-concept-illustration_114360-9740.jpg?w=1380&t=st=1690933821~exp=1690934421~hmac=70ad0fa53ec5e6dbe40db5c656659b103042ebb292311403f1ced49bd9b99196"), description: nil),
    .init(titel: "Часы", image: URL(string: "https://img.freepik.com/free-vector/alarm-clock-concept-illustration_114360-17486.jpg?w=1380&t=st=1690933863~exp=1690934463~hmac=ed28dc871f877b0b480cb34c97de599b424b8dd42647ab6f1632b04479952481"), description: nil),
    .init(titel: "Холодильник", image: URL(string: "https://img.freepik.com/free-vector/refrigerator-with-closed-and-opened-door_1308-95206.jpg?w=1800&t=st=1690933882~exp=1690934482~hmac=06ecfc34ee142bd225e238c565e2d1a823436d74fbc548e98fd224482f759737"), description: nil),
])

let dishes: MainViewModel = .init(type: .dishes, items: [
    .init(titel: "пирог 1", image: URL(string: "https://malinika.ru/wp-content/uploads/8/7/1/871cc114eaf06d080438af29d8a3f938.jpeg"), description: "просто рецепт 1"),
    .init(titel: "пирог 2", image: URL(string: "https://api.planetapirogov.ru/storage/images/shop_product/475/eea6c66c.jpg"), description: "просто рецепт 2"),
    .init(titel: "пирог 3", image: URL(string: "https://i.pinimg.com/originals/8e/f7/43/8ef743a8c2a521d9bdbb4ce7ee7bad34.jpg"), description: "просто рецепт 3"),
])

let goods: MainViewModel = .init(type: .goods, items: [
    .init(titel: "Футболка", image: URL(string: "https://img.freepik.com/free-photo/shirt-mockup-concept-with-plain-clothing_23-2149448792.jpg?size=626&ext=jpg&ga=GA1.2.601643660.1690933713&semt=sph"), description: "Описание футболки"),
    .init(titel: "Хлеб", image: URL(string: ""), description: "Описание хлеба"),
    .init(titel: "", image: URL(string: "https://img.freepik.com/free-photo/freshly-bakery-products-and-spikelets-on-cloth-at-home-close-up-photo-of-freshly-baked-bread-products_613910-6786.jpg?size=626&ext=jpg&ga=GA1.2.601643660.1690933713&semt=sph"), description: "Описание "),
    .init(titel: "Компы", image: URL(string: "https://img.freepik.com/free-photo/modern-stationary-collection-arrangement_23-2149309643.jpg?size=626&ext=jpg&ga=GA1.2.601643660.1690933713&semt=sph"), description: "Описание компов"),
    .init(titel: "Корзина 1", image: URL(string: "https://img.freepik.com/free-photo/pink-empty-shopping-basket-online-shopping-concept-on-pink-background-3d-rendering_56104-1527.jpg?size=626&ext=jpg&ga=GA1.2.601643660.1690933713&semt=sph"), description: "Описание Корзина 1"),
    .init(titel: "Корзина 2", image: URL(string: "https://img.freepik.com/free-photo/pink-empty-shopping-basket-online-shopping-concept-on-pink-background-3d-rendering_56104-1527.jpg?size=626&ext=jpg&ga=GA1.2.601643660.1690933713&semt=sph"), description: "Описание Корзина 2"),
    .init(titel: "Корзина 3", image: URL(string: "https://img.freepik.com/free-photo/pink-empty-shopping-basket-online-shopping-concept-on-pink-background-3d-rendering_56104-1527.jpg?size=626&ext=jpg&ga=GA1.2.601643660.1690933713&semt=sph"), description: "Описание Корзина 3"),
])

let dataForlayout : [MainViewModel] = [adverticings, products, dishes, goods]

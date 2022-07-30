//
//  DetailImbalEntity.swift
//  TakeHome
//
//  Created by Cashlez Macbook 2021 on 7/30/22.
//

import Foundation

struct DetailImbalEntity: Codable {
    var category: String
    var category_id : Int
    var currency: String
    var custody: String
    var inception_date: String
    var im_avatar: String
    var im_name: String
    var min_balance: Int
    var min_redemption: Int
    var min_subscription: Int
    var nav: Float
    var return_cur_year: Float
    var return_five_year: Float
    var return_four_year: Float
    var return_inception_growth: Float
    var return_one_day: Float
    var return_one_month: Float
    var return_one_week: Float
    var return_one_year: Float
    var return_six_month: Float
    var return_three_month: Float
    var return_three_year: Float
    var return_two_year: Float
    var total_unit: Int
    var type: String
    var type_id: Int
    
    init(category: String,
         category_id: Int,
         currency: String,
         custody: String,
         inception_date: String,
         im_avatar: String,
         im_name: String,
         min_balance: Int,
         min_redemption: Int,
         min_subscription: Int,
         nav: Float,
         return_cur_year: Float,
         return_five_year: Float,
         return_four_year: Float,
         return_inception_growth: Float,
         return_one_day: Float,
         return_one_month: Float,
         return_one_week: Float,
         return_one_year: Float,
         return_six_month: Float,
         return_three_month: Float,
         return_three_year: Float,
         return_two_year: Float,
         total_unit: Int, type: String, type_id: Int) {
        self.category = category
        self.category_id = category_id
        self.currency = currency
        self.custody = custody
        self.inception_date = inception_date
        self.im_avatar = im_avatar
        self.im_name = im_name
        self.min_balance = min_balance
        self.min_redemption = min_redemption
        self.min_subscription = min_subscription
        self.nav = nav
        self.return_cur_year = return_cur_year
        self.return_five_year = return_five_year
        self.return_four_year = return_four_year
        self.return_inception_growth = return_inception_growth
        self.return_one_day = return_one_day
        self.return_one_month = return_one_month
        self.return_one_week = return_one_week
        self.return_one_year = return_one_year
        self.return_six_month = return_six_month
        self.return_three_month = return_three_month
        self.return_three_year = return_three_year
        self.return_two_year = return_two_year
        self.total_unit = total_unit
        self.type = type
        self.type_id = type_id
    }
}

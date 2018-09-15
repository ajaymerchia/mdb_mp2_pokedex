//
//  SearchFilter.swift
//  mdb_mp2_pokedex
//
//  Created by Ajay Raj Merchia on 9/13/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation

class SearchFilter: Equatable {
    enum FILTER_TYPE {
        case NAME_EQUALS
        case NUM_EQUALS
        case TYPE_EQUALS
        case INT_GREATER_THAN
    }
    
    enum STATS {
        case ATTACK
        case DEFENSE
        case HP
    }
    
    var filterType: FILTER_TYPE?
    var statType: STATS?
    var int_comparee: Int?
    var str_comparee: String?
    
    private init(_ _filterType: FILTER_TYPE) {
        filterType = _filterType
    }
    
    init(_ _comparee: String) {
        filterType = FILTER_TYPE.NAME_EQUALS
        str_comparee = _comparee
    }
    
    init(_ _comparee: Int) {
        filterType = FILTER_TYPE.INT_GREATER_THAN
        int_comparee = _comparee
    }
    
    static public let NAME_EQ  = SearchFilter(FILTER_TYPE.NAME_EQUALS)
    static public let NUM_EQ   = SearchFilter(FILTER_TYPE.NUM_EQUALS)
    static public let TYPE_EQ  = SearchFilter(FILTER_TYPE.TYPE_EQUALS)
    static public let STAT_GR  = SearchFilter(FILTER_TYPE.INT_GREATER_THAN)
    
    
    static func == (lhs: SearchFilter, rhs: SearchFilter) -> Bool {
        return lhs.generic_repr() == rhs.generic_repr()
    }
    
    static func == (lhs: SearchFilter, rhs: String) -> Bool {
        return lhs.generic_repr() == rhs
    }
    
    static func == (lhs: String, rhs: SearchFilter) -> Bool {
        return lhs == rhs.generic_repr()
    }
    
    func generic_repr() -> String {
        guard let filter = filterType else {
            return ""
        }
        switch filter {
        case .NAME_EQUALS:
            return "name"
        case .NUM_EQUALS:
            return "number"
        case .TYPE_EQUALS:
            return str_comparee!
        case .INT_GREATER_THAN:
            guard let type = statType else {
                return ""
            }
            switch type {
            case .ATTACK:
                return "attack"
            case .DEFENSE:
                return "defense"
            case .HP:
                return "hp"
            }
        }
    }
    
    public func pred(x: Pokemon) -> Bool {

        switch filterType! {
        case .NAME_EQUALS:
            return x.name.lowercased().contains(str_comparee!.lowercased())
        case .NUM_EQUALS:
            return x.number == int_comparee!
        case .TYPE_EQUALS:
            return x.types.contains(str_comparee!)
        case .INT_GREATER_THAN:
            guard let type = statType else {
                return false
            }
            guard let val = int_comparee else {
                return false
            }
            switch type {
            case .ATTACK:
                return x.attack > val
            case .DEFENSE:
                return x.defense > val
            case .HP:
                return x.health > val
            }
            
        }
    }
    
    static func create_name_filter (name: String) -> SearchFilter {
        let filter = SearchFilter(name)
        filter.filterType = FILTER_TYPE.NAME_EQUALS
        return filter
    }
    static func create_numb_filter (number: Int) -> SearchFilter {
        let filter = SearchFilter(number)
        filter.filterType = FILTER_TYPE.NUM_EQUALS
        return filter
    }
    static func create_type_filter (type: String) -> SearchFilter {
        let filter = SearchFilter(type)
        filter.filterType = FILTER_TYPE.TYPE_EQUALS
        return filter
    }
    static func create_attk_filter (min: Int) -> SearchFilter {
        let filter = SearchFilter(min)
        filter.filterType = FILTER_TYPE.INT_GREATER_THAN
        filter.statType = STATS.ATTACK
        return filter
    }
    static func create_dfns_filter (min: Int) -> SearchFilter {
        let filter = SearchFilter(min)
        filter.filterType = FILTER_TYPE.INT_GREATER_THAN
        filter.statType = STATS.DEFENSE
        return filter
    }
    static func create_hlth_filter (min: Int) -> SearchFilter {
        let filter = SearchFilter(min)
        filter.filterType = FILTER_TYPE.INT_GREATER_THAN
        filter.statType = STATS.HP
        return filter
    }
    
    
}

//
//  News.swift
//  NewsApp
//
//  Created by Amissan on 30/11/2022.
//

import UIKit


struct NewsService {
    static let baseUrl = "https://newsapi.org/v2"
    
    enum Categories: String {
        case Business, Santé = "Health", Sport = "Sports", Divertissement = "Entertainment", Technologie = "Technology", Général = "General"
    }
    
    enum Countries: String {
        case ae, ar, at, au, be, bg, br, ca, ch, cn, co, cu, cz, de, eg, fr, gb, gr, hk, hu, id, ie, il, in_ = "in", it, jp, kr, lt, lv, ma, mx, my, ng, nl, no, nz, ph, pl, pt, ro, rs, ru, sa, se, sg, si, sk, th, tr, tw, ua, us, ve, za
    }
    
    enum Languages: String {
        case ar, de, en, es, fr, he, it, nl, no, pt, ru, sv, ud, zh
    }
    
    private enum EndPoints {
        case everything
        case topHeadlines
        case mostNotableSourcesHeadlines
        
        var endPointURL: URLComponents? {
        switch self {
        case .everything:
            return URLComponents(string: NewsService.baseUrl + "/everything")
        case .topHeadlines:
            return URLComponents(string: NewsService.baseUrl + "/top-headlines")
        case .mostNotableSourcesHeadlines:
            return URLComponents(string: NewsService.baseUrl + "/top-headlines/sources")

        }}
    }
    
    // Get News Api Key from the suitable PLIST
    private static func getApiKey() -> String? {
        guard let url = Bundle.main.url(forResource: "apiKeys", withExtension: "plist") else {
            return nil
        }
        guard let data = try? Data(contentsOf: url) else {
            return nil
        }
        guard let apiKeysPlist = try? PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil) as? [String:String] else {
            return nil
        }
        return apiKeysPlist["NewsApiKey"]
    }
    
    // HOME TAB NEWS REQUEST
    static func getTopNewsOf(country: Countries, maxNumberOfResults: Int? = 20, completion: @escaping(Result<[ArticleModel], Error>)-> Void) {
        
        let _ = getNewsNetworkRequest(endPoint: EndPoints.topHeadlines, queryParams: ["country": country.rawValue, "pageSize": String(maxNumberOfResults!)], completion: completion)
        
    }
    
    // SEARCH TAB: CATEGORY NEWS REQUEST
    static func getNewsFromCategory(_ category: Categories, of country: Countries, maxNumberOfResults: Int? = 20, completion: @escaping(Result<[ArticleModel], Error>)-> Void) {
        
        let _ = getNewsNetworkRequest(endPoint: EndPoints.topHeadlines, queryParams: ["category": category.rawValue, "country": country.rawValue, "pageSize": String(maxNumberOfResults!)], completion: completion)
    }
    
    // SEARCH TAB: SEARCH REQUEST
    static func getArticlesRelated(to: String, in language: Languages, maxNumberOfResults: Int? = 50, completion: @escaping(Result<[ArticleModel], Error>)-> Void) {
        
        let _ = getNewsNetworkRequest(endPoint: EndPoints.everything, queryParams: ["q": to, "language": language.rawValue, "pageSize": String(maxNumberOfResults!)], completion: completion)
    }
    
    
    private static func getNewsNetworkRequest(endPoint: EndPoints, queryParams: [String: String], completion: @escaping(Result<[ArticleModel], Error>)-> Void ) {

        guard let apiKey = getApiKey(), var requestEndPoint = endPoint.endPointURL else {
            debugPrint("### Error: Incorrect apiKey or wrong endpoint ###")
            return
        }

        requestEndPoint.queryItems = []
        
        for (param, paramValue) in queryParams {
            requestEndPoint.queryItems?.append(URLQueryItem(name: param, value: paramValue))
        }
        
        guard requestEndPoint.url != nil else {
            debugPrint("### Error: Endpoint URL is not after adding parameters into the url ###")
            return
        }
        
        var getNewsRequest = URLRequest(url:  requestEndPoint.url!)
        
        getNewsRequest.httpMethod = "GET"
        getNewsRequest.addValue(apiKey, forHTTPHeaderField:"Authorization" )
        
        URLSession.shared.dataTask(with: getNewsRequest) {
            (data, response, error) in

            debugPrint("====== GETTING NEWS REQUEST ======")

            guard let data = data else {
                debugPrint("No data from the API")
                debugPrint("==================================")
                return
            }
            guard let _ = response else {
                debugPrint("No response from the API")
                debugPrint("==================================")
                return
            }
            
            // Debug print of the JSON RESPONSE
            debugPrint(String(data: data, encoding: .utf8) ?? "")
            
            do {
                let news = try JSONDecoder().decode(NewsResponseModel.self, from: data)
                let articles = news.articles ?? []
                
                debugPrint("+++ Success: News has successfully been decoded +++")
                
                completion(.success(articles))
            } catch let error {

                debugPrint("### Error: problem encountered when trying to decode the news ###")

                completion(.failure(error))
            }
        }.resume()
    }
    
}





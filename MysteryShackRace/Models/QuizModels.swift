//
//  QuizModels.swift
//  MysteryShackRace
//
//  Created by Mürvet Arslan on 29.01.2026.
//

import Foundation

// Soru modeli (sorunun iskeleti icin) olusturuyorum
struct Question: Codable {
    let id: String
    let text: String // Sorunun kendisi
    let options: [String] // Şıklar
    let correctAnswerIndex: Int // Doğru cevabın dizideki sırası
    let difficulty: Int // Zorluk seviyesi (Karakter seviyesine göre soru sormak icin)
}

// Karakter modeli (seviye atladıkça açılacak karakterler icin) olusturuyorum
struct GameCharacter: Codable {
    let name: String
    let imageName: String // Assets'e koyacağım resmin adı
    let requiredScore: Int // Bu karaktere dönüşmek için gereken toplam puan
    let bio: String  // Karakter hakkında kısa bilgi
}

// Kullanıcı modeli olusturuyorum
struct UserProfile: Codable {
    let id: String
    let email: String
    var username: String
    var totalScore: Int // Toplam puanı
    var currentEnergy: Int // Mevcut enerjisi
    var lastEnergyUpdate: Date // Enerjinin en son ne zaman yenilendiği (Süre hesabı için)
}

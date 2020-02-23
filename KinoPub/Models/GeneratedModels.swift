import Foundation
import AnyCodable

// swiftlint:disable redundant_string_enum_value

// MARK: - Item
public struct Item: Codable {
    public let id: Int
    public let type: String
    public let subtype: String
    public let title: String
    public let year: Int
    public let cast: String
    public let director: String
    public let genres: [TitledModel]
    public let countries: [TitledModel]
    public let voice: String
    public let duration: Duration
    public let langs: Int
    public let quality: Int
    public let plot: String
    public let tracklist: AnyCodable
    public let imdb: Int
    public let imdbRating: Double
    public let imdbVotes: Int
    public let kinopoisk: Int
    public let kinopoiskRating: Double
    public let kinopoiskVotes: Int
    public let rating: Int
    public let ratingVotes: String
    public let ratingPercentage: String
    public let views: Int
    public let comments: Int
    public let posters: Posters
    public let trailer: Trailer
    public let finished: Bool
    public let advert: Bool
    public let poorQuality: Bool
    public let createdAt: Int
    public let updatedAt: Int
    public let inWatchlist: Bool?
    public let subscribed: Bool?
    public let subtitles: String
    public let bookmarks: [TitledModel]
    public let ac3: Int
    public let seasons: [Season]?
    public let videos: [Video]?
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case type = "type"
        case subtype = "subtype"
        case title = "title"
        case year = "year"
        case cast = "cast"
        case director = "director"
        case genres = "genres"
        case countries = "countries"
        case voice = "voice"
        case duration = "duration"
        case langs = "langs"
        case quality = "quality"
        case plot = "plot"
        case tracklist = "tracklist"
        case imdb = "imdb"
        case imdbRating = "imdb_rating"
        case imdbVotes = "imdb_votes"
        case kinopoisk = "kinopoisk"
        case kinopoiskRating = "kinopoisk_rating"
        case kinopoiskVotes = "kinopoisk_votes"
        case rating = "rating"
        case ratingVotes = "rating_votes"
        case ratingPercentage = "rating_percentage"
        case views = "views"
        case comments = "comments"
        case posters = "posters"
        case trailer = "trailer"
        case finished = "finished"
        case advert = "advert"
        case poorQuality = "poor_quality"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case inWatchlist = "in_watchlist"
        case subscribed = "subscribed"
        case subtitles = "subtitles"
        case bookmarks = "bookmarks"
        case ac3 = "ac3"
        case seasons = "seasons"
        case videos = "videos"
    }
    public init(id: Int, type: String, subtype: String, title: String, year: Int, cast: String, director: String, genres: [TitledModel], countries: [TitledModel], voice: String, duration: Duration, langs: Int, quality: Int, plot: String, tracklist: AnyCodable, imdb: Int, imdbRating: Double, imdbVotes: Int, kinopoisk: Int, kinopoiskRating: Double, kinopoiskVotes: Int, rating: Int, ratingVotes: String, ratingPercentage: String, views: Int, comments: Int, posters: Posters, trailer: Trailer, finished: Bool, advert: Bool, poorQuality: Bool, createdAt: Int, updatedAt: Int, inWatchlist: Bool?, subscribed: Bool?, subtitles: String, bookmarks: [TitledModel], ac3: Int, seasons: [Season]?, videos: [Video]?) {
        self.id = id
        self.type = type
        self.subtype = subtype
        self.title = title
        self.year = year
        self.cast = cast
        self.director = director
        self.genres = genres
        self.countries = countries
        self.voice = voice
        self.duration = duration
        self.langs = langs
        self.quality = quality
        self.plot = plot
        self.tracklist = tracklist
        self.imdb = imdb
        self.imdbRating = imdbRating
        self.imdbVotes = imdbVotes
        self.kinopoisk = kinopoisk
        self.kinopoiskRating = kinopoiskRating
        self.kinopoiskVotes = kinopoiskVotes
        self.rating = rating
        self.ratingVotes = ratingVotes
        self.ratingPercentage = ratingPercentage
        self.views = views
        self.comments = comments
        self.posters = posters
        self.trailer = trailer
        self.finished = finished
        self.advert = advert
        self.poorQuality = poorQuality
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.inWatchlist = inWatchlist
        self.subscribed = subscribed
        self.subtitles = subtitles
        self.bookmarks = bookmarks
        self.ac3 = ac3
        self.seasons = seasons
        self.videos = videos
    }
}

// MARK: - TitledModel
public struct TitledModel: Codable {
    public let id: Int
    public let title: String
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
    }
    public init(id: Int, title: String) {
        self.id = id
        self.title = title
    }
}

// MARK: - Duration
public struct Duration: Codable {
    public let average: Double
    public let total: Int
    private enum CodingKeys: String, CodingKey {
        case average = "average"
        case total = "total"
    }
    public init(average: Double, total: Int) {
        self.average = average
        self.total = total
    }
}

// MARK: - Posters
public struct Posters: Codable {
    public let small: String
    public let medium: String
    public let big: String
    public let wide: String
    private enum CodingKeys: String, CodingKey {
        case small = "small"
        case medium = "medium"
        case big = "big"
        case wide = "wide"
    }
    public init(small: String, medium: String, big: String, wide: String) {
        self.small = small
        self.medium = medium
        self.big = big
        self.wide = wide
    }
}

// MARK: - Season
public struct Season: Codable {
    public let title: String
    public let number: Int
    public let watching: SeasonWatching
    public let episodes: [Episode]
    private enum CodingKeys: String, CodingKey {
        case title = "title"
        case number = "number"
        case watching = "watching"
        case episodes = "episodes"
    }
    public init(title: String, number: Int, watching: SeasonWatching, episodes: [Episode]) {
        self.title = title
        self.number = number
        self.watching = watching
        self.episodes = episodes
    }
}

// MARK: - Episode
public struct Episode: Codable {
    public let id: Int
    public let title: String
    public let thumbnail: String
    public let duration: Int
    public let tracks: Int
    public let number: Int
    public let ac3: Int
    public let audios: [EpisodeAudio]
    public let watched: Int
    public let watching: EpisodeWatching
    public let subtitles: [Subtitle]
    public let files: [File]
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case thumbnail = "thumbnail"
        case duration = "duration"
        case tracks = "tracks"
        case number = "number"
        case ac3 = "ac3"
        case audios = "audios"
        case watched = "watched"
        case watching = "watching"
        case subtitles = "subtitles"
        case files = "files"
    }
    public init(id: Int, title: String, thumbnail: String, duration: Int, tracks: Int, number: Int, ac3: Int, audios: [EpisodeAudio], watched: Int, watching: EpisodeWatching, subtitles: [Subtitle], files: [File]) {
        self.id = id
        self.title = title
        self.thumbnail = thumbnail
        self.duration = duration
        self.tracks = tracks
        self.number = number
        self.ac3 = ac3
        self.audios = audios
        self.watched = watched
        self.watching = watching
        self.subtitles = subtitles
        self.files = files
    }
}

// MARK: - EpisodeAudio
public struct EpisodeAudio: Codable {
    public let id: Int
    public let index: Int
    public let codec: String
    public let channels: Int
    public let lang: String
    public let type: TypeClass?
    public let author: Author?
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case index = "index"
        case codec = "codec"
        case channels = "channels"
        case lang = "lang"
        case type = "type"
        case author = "author"
    }
    public init(id: Int, index: Int, codec: String, channels: Int, lang: String, type: TypeClass?, author: Author?) {
        self.id = id
        self.index = index
        self.codec = codec
        self.channels = channels
        self.lang = lang
        self.type = type
        self.author = author
    }
}

// MARK: - Author
public struct Author: Codable {
    public let id: Int
    public let title: String
    public let shortTitle: AnyCodable
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case shortTitle = "short_title"
    }
    public init(id: Int, title: String, shortTitle: AnyCodable) {
        self.id = id
        self.title = title
        self.shortTitle = shortTitle
    }
}

// MARK: - TypeClass
public struct TypeClass: Codable {
    public let id: Int
    public let title: String
    public let shortTitle: String
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case shortTitle = "short_title"
    }
    public init(id: Int, title: String, shortTitle: String) {
        self.id = id
        self.title = title
        self.shortTitle = shortTitle
    }
}

// MARK: - File
public struct File: Codable {
    public let codec: String
    public let w: Int
    public let h: Int
    public let quality: String
    public let qualityID: Int
    public let url: URLClass
    private enum CodingKeys: String, CodingKey {
        case codec = "codec"
        case w = "w"
        case h = "h"
        case quality = "quality"
        case qualityID = "quality_id"
        case url = "url"
    }
    public init(codec: String, w: Int, h: Int, quality: String, qualityID: Int, url: URLClass) {
        self.codec = codec
        self.w = w
        self.h = h
        self.quality = quality
        self.qualityID = qualityID
        self.url = url
    }
}

// MARK: - URLClass
public struct URLClass: Codable {
    public let http: String
    public let hls: String
    public let hls4: String
    public let hls2: String
    private enum CodingKeys: String, CodingKey {
        case http = "http"
        case hls = "hls"
        case hls4 = "hls4"
        case hls2 = "hls2"
    }
    public init(http: String, hls: String, hls4: String, hls2: String) {
        self.http = http
        self.hls = hls
        self.hls4 = hls4
        self.hls2 = hls2
    }
}

// MARK: - Subtitle
public struct Subtitle: Codable {
    public let lang: String
    public let shift: Int
    public let embed: Bool
    public let url: String
    private enum CodingKeys: String, CodingKey {
        case lang = "lang"
        case shift = "shift"
        case embed = "embed"
        case url = "url"
    }
    public init(lang: String, shift: Int, embed: Bool, url: String) {
        self.lang = lang
        self.shift = shift
        self.embed = embed
        self.url = url
    }
}

// MARK: - EpisodeWatching
public struct EpisodeWatching: Codable {
    public let status: Int
    public let time: Int
    private enum CodingKeys: String, CodingKey {
        case status = "status"
        case time = "time"
    }
    public init(status: Int, time: Int) {
        self.status = status
        self.time = time
    }
}

// MARK: - SeasonWatching
public struct SeasonWatching: Codable {
    public let status: Int
    private enum CodingKeys: String, CodingKey {
        case status = "status"
    }
    public init(status: Int) {
        self.status = status
    }
}

// MARK: - Trailer
public struct Trailer: Codable {
    public let id: Int
    public let url: String
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case url = "url"
    }
    public init(id: Int, url: String) {
        self.id = id
        self.url = url
    }
}

// MARK: - Video
public struct Video: Codable {
    public let id: Int
    public let title: String
    public let thumbnail: String
    public let duration: Int
    public let tracks: Int
    public let number: Int
    public let ac3: Int
    public let audios: [VideoAudio]
    public let watched: Int
    public let watching: EpisodeWatching
    public let subtitles: [Subtitle]
    public let files: [File]
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case thumbnail = "thumbnail"
        case duration = "duration"
        case tracks = "tracks"
        case number = "number"
        case ac3 = "ac3"
        case audios = "audios"
        case watched = "watched"
        case watching = "watching"
        case subtitles = "subtitles"
        case files = "files"
    }
    public init(id: Int, title: String, thumbnail: String, duration: Int, tracks: Int, number: Int, ac3: Int, audios: [VideoAudio], watched: Int, watching: EpisodeWatching, subtitles: [Subtitle], files: [File]) {
        self.id = id
        self.title = title
        self.thumbnail = thumbnail
        self.duration = duration
        self.tracks = tracks
        self.number = number
        self.ac3 = ac3
        self.audios = audios
        self.watched = watched
        self.watching = watching
        self.subtitles = subtitles
        self.files = files
    }
}

// MARK: - VideoAudio
public struct VideoAudio: Codable {
    public let id: Int
    public let index: Int
    public let codec: String
    public let channels: Int
    public let lang: String
    public let type: TypeClass
    public let author: TypeClass?
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case index = "index"
        case codec = "codec"
        case channels = "channels"
        case lang = "lang"
        case type = "type"
        case author = "author"
    }
    public init(id: Int, index: Int, codec: String, channels: Int, lang: String, type: TypeClass, author: TypeClass?) {
        self.id = id
        self.index = index
        self.codec = codec
        self.channels = channels
        self.lang = lang
        self.type = type
        self.author = author
    }
}

public struct Bookmark: Codable {
    public let id: Int
    public let title: String
    public let views: Int
    public let count: String
    public let created: Int
    public let updated: Int

    public init(id: Int, title: String, views: Int, count: String, created: Int, updated: Int) {
        self.id = id
        self.title = title
        self.views = views
        self.count = count
        self.created = created
        self.updated = updated
    }

    // MARK: - Item
    public struct Item: Codable, Hashable {
        public let id: Int
        public let type: String
        public let subtype: String
        public let title: String
        public let year: Int
        public let cast: String
        public let director: String
        public let genres: [Country]
        public let countries: [Country]
        public let voice: String?
        public let duration: Duration
        public let langs: Int
        public let quality: Int
        public let plot: String
        public let imdb: Int?
        public let imdbRating: Double?
        public let imdbVotes: Int?
        public let kinopoisk: Int?
        public let kinopoiskRating: Double?
        public let kinopoiskVotes: Int?
        public let rating: Int
        public let ratingVotes: String
        public let ratingPercentage: String
        public let views: Int
        public let comments: Int
        public let posters: Posters
        public let trailer: Trailer?
        public let finished: Bool
        public let advert: Bool
        public let poorQuality: Bool
        public let createdAt: Int
        public let updatedAt: Int
        public let inWatchlist: Bool?
        public let subscribed: Bool?
        public let subtitles: String

        private enum CodingKeys: String, CodingKey {
            case id = "id"
            case type = "type"
            case subtype = "subtype"
            case title = "title"
            case year = "year"
            case cast = "cast"
            case director = "director"
            case genres = "genres"
            case countries = "countries"
            case voice = "voice"
            case duration = "duration"
            case langs = "langs"
            case quality = "quality"
            case plot = "plot"
            case imdb = "imdb"
            case imdbRating = "imdb_rating"
            case imdbVotes = "imdb_votes"
            case kinopoisk = "kinopoisk"
            case kinopoiskRating = "kinopoisk_rating"
            case kinopoiskVotes = "kinopoisk_votes"
            case rating = "rating"
            case ratingVotes = "rating_votes"
            case ratingPercentage = "rating_percentage"
            case views = "views"
            case comments = "comments"
            case posters = "posters"
            case trailer = "trailer"
            case finished = "finished"
            case advert = "advert"
            case poorQuality = "poor_quality"
            case createdAt = "created_at"
            case updatedAt = "updated_at"
            case inWatchlist = "in_watchlist"
            case subscribed = "subscribed"
            case subtitles = "subtitles"
        }

        public init(id: Int, type: String, subtype: String, title: String, year: Int, cast: String, director: String, genres: [Country], countries: [Country], voice: String?, duration: Duration, langs: Int, quality: Int, plot: String, imdb: Int?, imdbRating: Double?, imdbVotes: Int?, kinopoisk: Int?, kinopoiskRating: Double?, kinopoiskVotes: Int?, rating: Int, ratingVotes: String, ratingPercentage: String, views: Int, comments: Int, posters: Posters, trailer: Trailer?, finished: Bool, advert: Bool, poorQuality: Bool, createdAt: Int, updatedAt: Int, inWatchlist: Bool?, subscribed: Bool?, subtitles: String) {
            self.id = id
            self.type = type
            self.subtype = subtype
            self.title = title
            self.year = year
            self.cast = cast
            self.director = director
            self.genres = genres
            self.countries = countries
            self.voice = voice
            self.duration = duration
            self.langs = langs
            self.quality = quality
            self.plot = plot
            self.imdb = imdb
            self.imdbRating = imdbRating
            self.imdbVotes = imdbVotes
            self.kinopoisk = kinopoisk
            self.kinopoiskRating = kinopoiskRating
            self.kinopoiskVotes = kinopoiskVotes
            self.rating = rating
            self.ratingVotes = ratingVotes
            self.ratingPercentage = ratingPercentage
            self.views = views
            self.comments = comments
            self.posters = posters
            self.trailer = trailer
            self.finished = finished
            self.advert = advert
            self.poorQuality = poorQuality
            self.createdAt = createdAt
            self.updatedAt = updatedAt
            self.inWatchlist = inWatchlist
            self.subscribed = subscribed
            self.subtitles = subtitles
        }
    }
    // MARK: - Country
    public struct Country: Codable, Hashable {
        public let id: Int
        public let title: String

        private enum CodingKeys: String, CodingKey {
            case id = "id"
            case title = "title"
        }

        public init(id: Int, title: String) {
            self.id = id
            self.title = title
        }
    }
    // MARK: - Duration
    public struct Duration: Codable, Hashable {
        public let average: Double
        public let total: Int

        private enum CodingKeys: String, CodingKey {
            case average = "average"
            case total = "total"
        }

        public init(average: Double, total: Int) {
            self.average = average
            self.total = total
        }
    }
    // MARK: - Posters
    public struct Posters: Codable, Hashable {
        public let small: String
        public let medium: String
        public let big: String
        public let wide: String?

        private enum CodingKeys: String, CodingKey {
            case small = "small"
            case medium = "medium"
            case big = "big"
            case wide = "wide"
        }

        public init(small: String, medium: String, big: String, wide: String?) {
            self.small = small
            self.medium = medium
            self.big = big
            self.wide = wide
        }
    }
    // MARK: - Trailer
    public struct Trailer: Codable, Hashable {
        public let id: Int
        public let url: String

        private enum CodingKeys: String, CodingKey {
            case id = "id"
            case url = "url"
        }

        public init(id: Int, url: String) {
            self.id = id
            self.url = url
        }
    }

}

// MARK: - Pagination
public struct Pagination: Codable {
    public let total: Int
    public let current: Int
    public let perpage: Int

    private enum CodingKeys: String, CodingKey {
        case total = "total"
        case current = "current"
        case perpage = "perpage"
    }

    public init(total: Int, current: Int, perpage: Int) {
        self.total = total
        self.current = current
        self.perpage = perpage
    }
}

public struct Directory: Codable, Hashable {
    public let id: Int
    public let title: String
    public let views: Int
    public let created: Int
    public let updated: Int

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case views = "views"
        case created = "created"
        case updated = "updated"
    }

    public init(id: Int, title: String, views: Int, created: Int, updated: Int) {
        self.id = id
        self.title = title
        self.views = views
        self.created = created
        self.updated = updated
    }
}

extension Bookmark: Identifiable { }
extension Bookmark: Hashable { }

extension Item: Identifiable { }
extension Bookmark.Item: Identifiable { }

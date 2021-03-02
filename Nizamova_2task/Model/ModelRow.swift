

import Foundation

internal struct ModelRow
{

    internal var title: String
    internal var subtitle: String

    internal init(raw: ModelRowRaw)
    {
        self.title = raw.title
        self.subtitle = raw.subtitle
    }

}

internal struct ModelRowRaw: Decodable
{

    internal var title: String
    internal var subtitle: String

}

internal final class DataService
{
    internal func getData() -> ModelRow?
    {
        let decoder = JSONDecoder()
        guard let path = Bundle.main.path(forResource: "Model/ModelRow", ofType: "json"),
              let data = try? Data(contentsOf: URL(fileURLWithPath: path)),
              let raw = try? decoder.decode(ModelRowRaw.self, from: data) else
        {
            return nil
        }
        return ModelRow(raw: raw)
    }
}

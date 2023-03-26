struct ProfileCellModel {
    var id: Int
    var image: String
    var title: String
    var style: ProfileCellStyle
    
    enum ProfileCellStyle {
        case isNavigation, empty
        case isText(String)
        case action(() -> Void)
    }
}


import UIKit

private func LOG(_ message: String)
{
    NSLog("CharactersView \(message)")
}

private let INSET: CGFloat = 15
private let ITEM_SIZE = CGSize(width: 130, height: 200)

class CharactersView:
    UIView,
    UICollectionViewDataSource,
    UICollectionViewDelegate
{

    // MARK: - SETUP

    override func awakeFromNib()
    {
        super.awakeFromNib()
        self.setupCollectionView()
    }
    
    // MARK: - COLLECTION VIEW

    @IBOutlet private var collectionView: UICollectionView!

    private func setupCollectionView()
    {
        self.collectionView.register(
            Cell.self,
            forCellWithReuseIdentifier: self.CELL_ID
        )

        self.collectionView.dataSource = self
        self.collectionView.delegate = self

        let layout = UICollectionViewFlowLayout()
        layout.itemSize = ITEM_SIZE
        layout.sectionInset =
            UIEdgeInsets(top: INSET, left: INSET, bottom: INSET, right: INSET)
        self.collectionView.collectionViewLayout = layout
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return self.items.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        return self.cell(forItemAt: indexPath)
    }

    // MARK: - CELL

    private let CELL_ID = "CELL_ID"
    private typealias CellView = CharactersItemView
    private typealias Cell = UICollectionViewCellTemplate<CellView>

    private func cell(forItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell =
            self.collectionView.dequeueReusableCell(
                withReuseIdentifier: self.CELL_ID,
                for: indexPath
            )
            as! Cell

        let item = self.items[indexPath.row]
        cell.itemView.image = item.image

        return cell
    }

    // MARK: - ITEMS

    var items = [CharactersItem]()
    {
        didSet
        {
            self.collectionView.reloadData()
        }
    }

    // MARK: - ITEM SELECTION

    var selectedItemId = -1
    var selectedItemChanged: SimpleCallback?

    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        self.selectedItemId = indexPath.row
        // Report the change.
        if let report = self.selectedItemChanged
        {
            report()
        }
    }

}


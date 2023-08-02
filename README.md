# UIKIT UICollectionViewCompositionalLayout

Простой экранчик с несколькими секциями UICollectionViewCell разного типа. 
Данный подход популярен для сложных вьюшек. 

## Основные помогалки:

```swift
func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { [weak self] 
(sectionIndex, environment) -> NSCollectionLayoutSection? in
            guard let self = self else { return nil }
            let currentSection = self.viewModel[sectionIndex]
            switch currentSection.type {
            case .adverticing:
                return createCompositionalLayoutForAdverticing()
            case .products:
                return createCompositionalLayoutForProducts()
            case .dishes:
                return createCompositionalLayoutForDishes()
            }
        }
        return layout
    }
```

```swift
func createCompositionalLayoutForAdverticing() -> 
NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)))
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(widthDimension: .fractionalWidth(1),
                              heightDimension: .absolute(200)),
            subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .paging
        return section
    }
```

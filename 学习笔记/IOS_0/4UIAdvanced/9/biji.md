1. UIDynamic
    1. 三个部分
        1. Dynamic Animator: 动画者，为动力学元素提供物理学相关的能力以及动画，同时为这些元素提供相关的上下文，是动力学元素与底层iOS之间的中介，将behaivor动画添加到Animator即可实现动力仿真
        2. Dynamic Animator item: 动力学元素，是遵守了UIDynamicItem协议的对象，从iOS7.0开始，UIView和UICollectionViewLayoutAttributes默认遵守该协议，如果自定义的对象实现了该协议，即可通过Dynamic Animator实现物理仿真
        3. UIDynamicBehavior：仿真行为，是动力学行为的父类，基本的动力学行为UIGravityBehavior，UICollisionBehavior，UIAttachmentBehavior，UISnapBehavior，UIPushBehavior和UIDynamicItemBehavior均继承自该父类

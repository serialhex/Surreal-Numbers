

import qualified Data.Set as Set


--Definition 1. A surreal number is a pair of sets of previously created surreal numbers. The sets are known as the “left set” and the “right set”. No member of the right set may be less than or equal to any member of the left set.
--Definition 2. A surreal number x is less than or equal to a surreal number y if and only if y is less than or equal to no member of x’s left set, and no member of y’s right set is less than or equal to x.
data Surreal =Nil | Surreal  { left  :: Set.Set Surreal
                             , right :: Set.Set Surreal
                             } deriving (Show, Eq)

-- make things easier...
nil = Nil

-- 'official' constructor for surreals
surreal :: Surreal -> Surreal -> Surreal
x `surreal` y = (Set.singleton x) `Surreal` (Set.singleton y)

() = surreal

--{ | }. This representation, where L and R are both empty, is called 0. Subsequent stages yield forms like:
--{ 0 | } = 1
--{ 1 | } = 2
--{ 2 | } = 3
zero = nil `surreal` nil
one = zero `surreal` nil
two = one `surreal` nil
neg_one = nil `surreal` zero


--construct l r = (Set.intersection l r) == Set.empty

instance Ord Surreal where  --this dosn;t work yet
  --compare x y = not (y <= left x)

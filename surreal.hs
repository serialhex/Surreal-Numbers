

import qualified Data.Set as Set


--Definition 1. A surreal number is a pair of sets of previously created surreal numbers. The sets are known as the “left set” and the “right set”. No member of the right set may be less than or equal to any member of the left set.
--Definition 2. A surreal number x is less than or equal to a surreal number y if and only if y is less than or equal to no member of x’s left set, and no member of y’s right set is less than or equal to x.
data Surreal = Nil | Surreal  { left  :: Set.Set Surreal
                              , right :: Set.Set Surreal
                              } deriving (Show)


-- make things easier...
nil = Nil

-- 'official' constructor for surreals
surreal :: [Surreal] -> [Surreal] -> Surreal
x `surreal` y = (Set.fromList x) `Surreal` (Set.fromList y)

(~|~) :: Surreal -> Surreal -> Surreal
(~|~) x y = surreal [x] [y]

--{ | }. This representation, where L and R are both empty, is called 0. Subsequent stages yield forms like:
--{ 0 | } = 1
--{ 1 | } = 2
--{ 2 | } = 3
zero = nil ~|~ nil
one = zero ~|~ nil
two = one ~|~ nil
neg_one = nil ~|~ zero

neg_two = nil ~|~ neg_one


--construct l r = (Set.intersection l r) == Set.empty

instance Eq Surreal where
    x == y = (x <= y) && (y <= x)

-- If x = {XL | XR} and y = {YL | YR} are surreal numbers, then x≤y if/f:
-- ¬∃xi∈XL: y≤xi. (y is never less than any member of the left set of x.)
-- ¬∃yi∈YR: yi≤x. (x is never greater than any member in the right set of y.)
instance Ord Surreal where  --this dosn;t work yet
  --compare :: Surreal -> Surreal -> Ordering
  --compare x y = not (y <= (Set.findMin left x)) and not ((Set.findMax right y) <= x)
  
  x <= y = (not (y <= (Set.findMin (left x)))) --and (not ((Set.findMax (right y)) <= x))
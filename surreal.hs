

import qualified Data.Set as Set


--Definition 1. A surreal number is a pair of sets of previously created surreal numbers. The sets are known as the “left set” and the “right set”. No member of the right set may be less than or equal to any member of the left set.
--Definition 2. A surreal number x is less than or equal to a surreal number y if and only if y is less than or equal to no member of x’s left set, and no member of y’s right set is less than or equal to x.
data Surreal  = Nil
              | Surreal { left  :: Surreal
                        , right :: Surreal
                        } deriving (Show, Eq)

--data Surreal2 = Surreal2 { left  :: Set.Set Surreal
--                          , right :: Set.Set Surreal
--                          } deriving (Show, Eq)

-- make things easier...
nil = Nil

--{ | }. This representation, where L and R are both empty, is called 0. Subsequent stages yield forms like:
--{ 0 | } = 1
--{ 1 | } = 2
--{ 2 | } = 3
zero = nil `Surreal` nil
one = zero `Surreal` nil
two = one `Surreal` nil
neg_one = nil `Surreal` zero


--construct l r = (Set.intersection l r) == Set.empty

instance Ord Surreal where  --this dosn;t work yet
  --compare x y = not (y <= left x)

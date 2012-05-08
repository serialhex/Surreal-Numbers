
-- In the beginning, everything was void...
import qualified Data.Set as Set
void = Set.empty

-- ...and J.H.W.H. Conway began to create numbers.

-- Conway said, "Let there be two rules which bring forth all numbers large and small."

-- "This shall be the first rule:"
-- "Every number corresponds to two sets of previously created numbers..."
data Surreal = Surreal  { left  :: Set.Set Surreal
                        , right :: Set.Set Surreal
                        } deriving (Show)

-- "...such that no member of the left set is greater than or equal to any member
-- of the right set."
surreal :: [Surreal] -> [Surreal] -> Surreal
x `surreal` y = let x' = (Set.fromList x)
                    y' = (Set.fromList y)
                in x' <= y'

-- "And the second rule shall be this:"
-- "One number shall be less than or equal to another number if and only if no
--  member of the first number's left set is greater than or equal to is greater
--  than or equal to the second number, and no member of the second numbers right
--  set is less than or equal to the first number"
instance Ord Surreal where
  x <= y = 

-- And Conway examined these two rules he had made, and behold! they were very good.
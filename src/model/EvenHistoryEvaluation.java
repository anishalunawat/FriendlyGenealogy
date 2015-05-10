package model;


import com.db4o.query.*;
public class EvenHistoryEvaluation implements Evaluation {
@Override
public void evaluate(Candidate candidate) {
Person car=(Person)candidate.getObject();
candidate.include(car.getEmail()== "piyush");
}
}
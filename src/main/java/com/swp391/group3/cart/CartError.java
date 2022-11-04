package com.swp391.group3.cart;

import java.io.Serializable;

public class CartError implements Serializable {
    private String invalidQuantityErr;
    private String exceedHoldingQuantityErr;

    public String getInvalidQuantityErr() {
        return invalidQuantityErr;
    }

    public void setInvalidQuantityErr(String invalidQuantityErr) {
        this.invalidQuantityErr = invalidQuantityErr;
    }

    public String getExceedHoldingQuantityErr() {
        return exceedHoldingQuantityErr;
    }

    public void setExceedHoldingQuantityErr(String exceedHoldingQuantityErr) {
        this.exceedHoldingQuantityErr = exceedHoldingQuantityErr;
    }
}

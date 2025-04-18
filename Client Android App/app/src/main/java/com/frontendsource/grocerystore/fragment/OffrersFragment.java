package com.frontendsource.grocerystore.fragment;


import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.DefaultItemAnimator;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;


import com.frontendsource.grocerystore.R;
import com.frontendsource.grocerystore.adapter.OfferAdapter;
import com.frontendsource.grocerystore.api.clients.RestClient;
import com.frontendsource.grocerystore.model.Offer;
import com.frontendsource.grocerystore.model.OfferResult;

import java.util.ArrayList;
import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;


/**
 * A simple {@link Fragment} subclass.
 */
public class OffrersFragment extends Fragment {

    private List<Offer> offerList = new ArrayList<>();
    private RecyclerView recyclerView;
    private OfferAdapter mAdapter;

    public OffrersFragment() {
        // Required empty public constructor
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        View view = inflater.inflate(R.layout.fragment_offer, container, false);
        recyclerView = view.findViewById(R.id.offer_rv);
         getOfferData();



        return view;
    }

    private void getOfferData() {
        Call<OfferResult>call = RestClient.getRestService(getContext()).offers();
        call.enqueue(new Callback<OfferResult>() {
            @Override
            public void onResponse(Call<OfferResult> call, Response<OfferResult> response) {
                if(response!=null){
                    OfferResult offerResult = response.body();
                    offerList = offerResult.getOfferList();
                    mAdapter = new OfferAdapter(offerList, getContext());
                    RecyclerView.LayoutManager mLayoutManager = new LinearLayoutManager(getContext());
                    recyclerView.setLayoutManager(mLayoutManager);
                    recyclerView.setItemAnimator(new DefaultItemAnimator());
                    recyclerView.setAdapter(mAdapter);
                }
            }

            @Override
            public void onFailure(Call<OfferResult> call, Throwable t) {

            }
        });
    }

    @Override
    public void onViewCreated(View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        //you can set the title for your toolbar here for different fragments different titles
        getActivity().setTitle("Offer");
    }
}
